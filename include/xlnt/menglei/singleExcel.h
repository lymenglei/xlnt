#ifndef SINGLEEXCEL_H
#define SINGLEEXCEL_H

#include <xlnt/xlnt.hpp>

// this is a single excel entity readed in RAM
namespace menglei {
class singleExcel
{
    public:
        singleExcel() = default;
        virtual ~singleExcel();

        void loadExcel(std::string fileName);
        xlnt::worksheet getSheetByIndex(int index);
    protected:

    private:
        xlnt::workbook wb;
        bool isLoaded = false;
};

} // namespace menglei
#endif // SINGLEEXCEL_H
