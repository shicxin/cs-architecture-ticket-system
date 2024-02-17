#if !defined(__TICKET__)
#define __TICKET__

#include <string>
#include <ctime>

#include "Name.h"

using namespace std;

namespace MyTicketSalesSys
{
    class Ticket:public Name
    {
    private: 
        string OrderNumber; // 订单号
        time_t ThisTime;    // 订单时间
        string StartingPlace;//目的地
        string Destination; // 起始地
        unsigned int Attr;  // 票的类型
        int price;          // 价格
    public:
        Ticket(string name, string Star, string Dest, unsigned int attr, int price);
        ~Ticket(){}
    };
}

#endif // __TICKET__
