#if !defined(__ADMIN_SYS__)
#define __ADMIN_SYS__

#include "Person.h"
namespace MyTicketSalesSys
{
    class admin:public Person
    {
    private:
        /*
        ///  所需数据全部在基类中被定义，只是有些数据在这个类中有了更加明确的范围
        ///  需要加上验证函数
        ///  账号为系统从数据库中获取
        ///  密码需要判断长度与特殊字符
        */
        bool CheckAttr() const;
    public:
        admin(string name, string password) :Person(name, password) { Person::SetAttr(1); }
        ~admin();
        void SetAttr(unsigned int attr) override;//在管理员类中不需要修改属性，将这个函数的调用更改为抛出异常
    };

}


#endif // __ADMIN_SYS__
