#if !defined(__TRAIN__)
#define __TRAIN__

#include"Name.h"

namespace MyTicketSalesSys
{
    class Train : public Name
    {
    private:
        unsigned int SeatTicket;
        unsigned int StandingTicket;
        unsigned int BedTicket;
    public:
        Train(string TrainName, unsigned int seat, unsigned int stan, unsigned int bed);
        ~Train(){}
    };
}


#endif // __TRAIN__
