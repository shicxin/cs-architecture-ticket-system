#if !defined(__TRAIN__)
#define __TRAIN__

#include <string>
#include <ctime>

#include "Name.h"

using namespace std;

namespace MyTicketSalesSys
{
    class Train:public Name
    {
    private: 
        string OrderNumber; // 订单号
        time_t ThisTime;    // 订单时间
        string StartingPlace;//目的地
        string Destination; // 起始地
        unsigned int Attr;  // 票的类型
        int price;          // 价格
    public:
        Train(string name, string Star, string Dest, unsigned int attr, int price);
        ~Train(){}
    };
}


#endif // __TRAIN__
