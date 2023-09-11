#include "Name.h"

namespace MyTicketSalesSys
{
    using namespace std;

    void Name::SetName(string name)
    {
        if(name.length() == 0)
        {
            throw "人名必须存在！";
        }
        this->name = name;
    }
    string Name::GetName()
    {
        return this->name;
    }
}
