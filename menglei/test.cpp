#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>


// #include <xlnt/menglei/myclass.h>
#include <xlnt/menglei/singleExcel.h>
#include <xlnt/menglei/functions.h>

extern "C"
{
    #include <xlnt/lua53/lua.h>
    #include <xlnt/lua53/lualib.h>
    #include <xlnt/lua53/lauxlib.h>
}


// ���ض�ά����
int func_return_table(lua_State *L)
{
    lua_newtable(L);
    menglei::stackDump(L);
    for(int i = 1; i <= 10; ++i)
    {
        lua_pushnumber(L, i);
        lua_newtable(L);
        for (int j = 1; j <= 10; ++j)
        {
            lua_pushnumber(L, j);
            lua_pushnumber(L, 10 - j);
            lua_settable(L,-3);
        }
        lua_settable(L,-3);
    }
    return 1;
}

// ��ʽ�ӿ�
int readExcel(lua_State *L)
{
    size_t length ;
    const char *s = luaL_checklstring(L, 1, &length);

    std::string fileName = s;
    menglei::singleExcel excel;
    excel.loadExcel(fileName);
    xlnt::worksheet ws = excel.getSheetByIndex(0);

    int i = 1, j = 1;
    lua_newtable(L);
    for (auto row : ws.rows(false))
    {
        lua_pushnumber(L, i);
        lua_newtable(L);
        j = 1;
        for (auto cell : row)
        {
            std::string temp = cell.to_string();
            lua_pushnumber(L, j);
            lua_pushstring(L, temp.c_str());
            lua_settable(L, -3);
            j++;
        }
        i++;
        lua_settable(L, -3);
    }
    // TODO
    return 1;
}



///////////////////////////////
static int readImpl(lua_State *L)
{
    size_t length ;
    const char *s = luaL_checklstring(L, 1, &length);
    //std::cout<< length << std::endl;
    std::string str = s;
    std::cout<< str << std::endl;
    //menglei::myclass tc;
    //tc.readImgl(str);
    return 0;
}


void testWrapper()
{
    /* ��ʼ��Lua */
    /* ָ��Lua��������ָ�� */
    lua_State* L = luaL_newstate(); // lua52 ֮�󣬾��Ƴ���lua_open ��������luaL_newstate������
    //testRegClass(L);
    /* ����Lua������ */
    luaL_openlibs(L);
    /* ע�ắ�� */
    lua_register(L, "dosomething", readImpl);
    lua_register(L, "ReadExcel", readExcel);
    lua_register(L, "func_return_table", func_return_table);
    /* ���нű� */
    int res = luaL_dofile(L, "lua/main.lua");
    if(res == 1 ) // error
    {
        std::string s;
        s += "================================\nlua stack trace:\n\n";
        s += lua_tostring(L, -1);
        s += "\n\n================================";
        std::cout << s  << std::endl;
    }
    /* ���Lua */
    lua_close(L);
}

int main()
{
    testWrapper();
    // TODO write your codes here
    std::cout << "Hello world!" << std::endl;
    //getwchar();
    return 0;
}
