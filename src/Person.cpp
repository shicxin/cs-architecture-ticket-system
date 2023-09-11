#include <iostream>
#include "Person.h"
namespace MyTicketSalesSys
{
    inline 
    bool Person::CheckAttr() const
    {
        return ((Attr > 0 && Attr < 6) ? true : false);
    }
    
    inline 
    void Person::SetPswd(string password) {pswd = password;}
    inline 
    void Person::SetAttr(unsigned int attr) { Attr = attr;}

    inline 
    string Person::GetAccount() const { return account;}
    inline 
    string Person::GetPswd() const { return pswd;}
    inline 
    unsigned int Person::GetAttr() const { return Attr;}
    inline 
    string Person::GetName() { return Name::GetName(); }
}