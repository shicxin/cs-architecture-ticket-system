# include "admin.h"

namespace MyTicketSalesSys
{
    bool admin::CheckAttr() const { return ((GetAttr() == 1) ? true : false); }
    admin::~admin()
    {
    }
}