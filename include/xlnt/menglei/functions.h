#ifndef FUNCTIONS_H
#define FUNCTIONS_H

extern "C"
{
    #include <xlnt/lua53/lua.h>
    #include <xlnt/lua53/lualib.h>
    #include <xlnt/lua53/lauxlib.h>
}
#include <iostream>
namespace menglei {

void stackDump (lua_State *L);

} // namespace menglei
#endif // FUNCTIONS_H
