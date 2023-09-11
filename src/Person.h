#if !defined(__PERSON__)
#define __PERSON__

#include <string>
#include "Name.h"

namespace MyTicketSalesSys
{
    class Person : public Name
    {
    private:
        const string account;//账号
        string pswd;//密码
        unsigned int Attr; //属性
        string GetNum() 
        {
            ///  从数据库中动态获取未分配的最小number
            return "100001";
        }
        /*
        ///  需要加上验证函数
        ///  账号为系统从数据库中获取
        ///  密码需要判断长度与特殊字符
        */
        bool CheckAttr() const;
    public:
        Person(string name, string password):Name(name), pswd(password), account(GetNum()), Attr(0) { }
        ~Person(){}
        void SetPswd(string password);
        virtual void SetAttr(unsigned int attr);
        string GetAccount() const;
        string GetPswd() const;
        unsigned int GetAttr() const;
        virtual string GetName() override;
    protected:
    };
}

#endif // __PERSON__
