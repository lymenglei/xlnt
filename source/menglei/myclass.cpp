#include "xlnt/menglei/myclass.h"

namespace menglei {



myclass::~myclass()
{
    //dtor
}

void myclass::test()
{
    std::cout << "myclass::test" << std::endl;
}

void int2str(const int &int_temp, std::string &string_temp)
{
	std::stringstream stream;
	stream << int_temp;
	string_temp = stream.str();
}

// TODO row is bigger than 'Z' , then ?
std::string getSheetIndex(int row, int col)
{
    char a = 'A';
	char b = a + row;

	std::string s;
	s = b;

	std::string temp;
	int2str(col, temp);
	s = s + temp;

	return s;
}

void testWriteFile(std::string context)
{
    std::ofstream out("out.lua");
    if(out.is_open())
    {
        out << context;
        out.close();
    }
}

void myclass::testWrite()
{
    xlnt::workbook wb;
    xlnt::worksheet ws = wb.active_sheet();
    ws.cell("A1").value(5);
    ws.cell("B2").value("string data");
    ws.cell("D2").value("sdd");
    ws.cell("C3").formula("=RAND()");
    ws.merge_cells("C3:C4");
    ws.freeze_panes("B2");
    wb.save("example.xlsx");
}

void printWorksheet(const xlnt::worksheet ws)
{
    std::string s = "";

    for (auto row : ws.rows(false))
    {
        for (auto cell : row)
        {
            std::string temp = cell.to_string();
            s += temp;
            s += " ";
        }
        s += "\n";
    }
    //std::clog << s << std::endl;
    testWriteFile(s);
}

void myclass::testRead()
{
    xlnt::workbook wb;
    wb.load("example.xlsx");
    xlnt::worksheet ws = wb.active_sheet();
    std::clog << "Processing spread sheet" << std::endl;
    std::string s = "";

    std::string res[10][10];
    int count1 = 0;
    int count2 = 0;
    for (auto row : ws.rows(false))
    {
        for (auto cell : row)
        {
            std::string temp = cell.to_string();
            s += temp;
            s += " ";
            if (count1 < 10 && count2 < 10)
                res[count1][count2] = temp;
            count2++;
        }
        s += "\n";
        count1++;
    }
    std::clog << s << std::endl;
    testWriteFile(s);
    std::clog << "Processing complete" << std::endl;

    for(int i = 0; i < 10; ++i)
    {
        for(int j = 0;j < 10; ++j)
        {
             std::clog << res[i][j];
        }
        std::clog << std::endl;
    }
}

void myclass::readImgl(std::string fileName)
{
    xlnt::workbook wb;
    wb.load(fileName);
    xlnt::worksheet ws = wb.sheet_by_index(0);
    printWorksheet(ws);
}

xlnt::worksheet myclass::read(std::string fileName)
{
    xlnt::workbook wb;
    wb.load(fileName);
    xlnt::worksheet ws = wb.sheet_by_index(0);
    return ws;
}

std::string myclass::getStringAtIndex(std::string fileName, int row, int col)
{
    return "";
}

//////////////////////////////////
 // load一个表到内存中，然后读，然后在移除这个表
// 获取一个对象
// 读取这个对象的数据并转换成字符串



} // namespace menglei
