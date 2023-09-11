#ifndef __NAME__
#define __NAME__

#include <string>

namespace MyTicketSalesSys
{
    using namespace std;
    class Name
    {
    private:
        string name;
        void SetName(string name);
    public:
        virtual string GetName() = 0;
    protected:
        Name(string name) { SetName(name); }
        ~Name(){}
    };
}

#endif