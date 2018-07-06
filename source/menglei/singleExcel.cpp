#include "xlnt/menglei/singleExcel.h"
namespace menglei {


singleExcel::~singleExcel()
{
    //dtor
}

void singleExcel::loadExcel(std::string fileName)
{
    wb.load(fileName);
    isLoaded = true;
}

// index start from 0
xlnt::worksheet singleExcel::getSheetByIndex(int index)
{
//    if(!isLoaded)
//    {
//        std::cout<<" please loadExcel before get sheet!" << std::endl;
//        return nullptr;
//    }

    xlnt::worksheet ws = wb.sheet_by_index(index);
    return ws;
}


} // namespace menglei
