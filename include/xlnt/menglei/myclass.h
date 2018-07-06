#ifndef MYCLASS_H
#define MYCLASS_H

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <xlnt/xlnt.hpp>

extern "C"
{
    #include <xlnt/lua53/lua.h>
    #include <xlnt/lua53/lualib.h>
    #include <xlnt/lua53/lauxlib.h>
}

namespace menglei {
class myclass
{
    public:
        myclass() = default;
        virtual ~myclass();
        void test();
        void testWrite();
        void testRead();

        void readImgl(std::string fileName);
        std::string getStringAtIndex(std::string fileName, int row, int col);

        xlnt::worksheet read(std::string fileName);

    protected:

    private:
};

} // namespace menglei

#endif // MYCLASS_H

