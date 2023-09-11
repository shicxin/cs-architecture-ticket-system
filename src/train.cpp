#include "train.h"

namespace MyTicketSalesSys
{
    Train::Train(string name, string Star, string Dest, unsigned int attr, int pri) : Name(name), ThisTime(time(NULL)), StartingPlace(Star), Destination(Dest), Attr(attr), price(pri) 
    {
        /*
        ///  添加对外接口操作数据库后初始化订单号
        */
    }
    
}