#include "train.h"


namespace MyTicketSalesSys
{
    Train::Train(string TrainName, unsigned int seat, unsigned int stan, unsigned int bed)
    : Name(TrainName), SeatTicket(seat), StandingTicket(stan), BedTicket(bed)
    {
    }
    
}