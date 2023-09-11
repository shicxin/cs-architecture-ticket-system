---
title: C++操作MySQL-Linux
date: 2023/8/29 15:58:59
updated: 2023/8/29 17:58:59
permalink: 
tags: MySQL
categories: Cplusplus
---

[toc]

# 下载相关软件包

1.   `MySQL`服务器

     >   `sudo apt-get install   mysql-server    //mysql服务端安装 `

2.   `MySQL`客户端

     >   `sudo apt-get install   mysql-client   //mysql客户端安装 `

3.   `MySQL`开发包

     >     `sudo apt-get install libmysqlclient-dev`

4.   默认安装修改密码

     >   `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';`
     >
     >   
     >
     >   ` flush privileges;`



# 测试连接

```c++
#include <iostream>
#include <mysql/mysql.h>
using namespace std;

int main()
{
    // 创建一个MYSQL对象
    MYSQL mysql;
    mysql_init(&mysql);

    // 连接MySQL服务器
    //
    if (mysql_real_connect(&mysql, "localhost", "root", "password", "数据库名", 3306, NULL, 0) == NULL)
    {
        cout << "连接失败: " << mysql_error(&mysql) << endl;
        return -1;
    }
    else
    {
        cout << "连接成功" << endl;
    }

    // 执行SQL查询语句
    string sql = "SELECT * FROM student";
    if (mysql_query(&mysql, sql.c_str()) != 0)
    {
        cout << "查询失败: " << mysql_error(&mysql) << endl;
        return -1;
    }
    else
    {
        cout << "查询成功" << endl;
    }

    // 获取结果集
    MYSQL_RES *result = mysql_store_result(&mysql);
    if (result == NULL)
    {
        cout << "获取结果失败: " << mysql_error(&mysql) << endl;
        return -1;
    }
    else
    {
        cout << "获取结果成功" << endl;
    }

    // 遍历结果集
    int num_fields = mysql_num_fields(result); // 获取字段数
    MYSQL_ROW row; // 定义一个行指针
    MYSQL_FIELD *field; // 定义一个字段指针

    // 打印表头
    while ((field = mysql_fetch_field(result)))
    {
        cout << field->name << "\t";
    }
    cout << endl;

    // 打印表内容
    while ((row = mysql_fetch_row(result)))
    {
        for (int i = 0; i < num_fields; i++)
        {
            cout << row[i] << "\t";
        }
        cout << endl;
    }

    // 释放结果集
    mysql_free_result(result);

    // 关闭连接
    mysql_close(&mysql);

    return 0;
}

```

# 常用API

| 函数                                                         | 说明                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| MYSQL *mysql_init(MYSQL *mysql)                              | 获取或初始化MYSQL结构                                        |
| MYSQL *mysql_real_connect(MYSQL *mysql, const char *host, const char *user, const char *passwd, const char *db, unsigned int port, const char *unix_socket, unsigned long client_flag) | 连接到MySQL服务器。                                          |
| int mysql_query(MYSQL *mysql, const char *stmt_str)          | 执行指定为“以Null终结的字符串”的SQL查询。                    |
| MYSQL_RES *mysql_store_result(MYSQL *mysql)                  | 将查询的整个结果读取到客户端，分配一个 MYSQL_RES结构，并将结果放入此结构中 |
| unsigned int mysql_field_count(MYSQL *mysql)                 | 返回上次执行语句的结果集的列数。                             |
| unsigned int mysql_num_fields(MYSQL_RES *result)             | 返回结果集中的列数。                                         |
| my_ulonglong mysql_num_rows(MYSQL_RES *result)               | 返回结果集中的行数。                                         |
| MYSQL_ROW mysql_fetch_row(MYSQL_RES *result)                 | 从结果集中获取下一行数据                                     |
| void mysql_free_result(MYSQL_RES *result)                    | 释放结果集空间                                               |

```c++
/// 测试连接与增删改查
/// g++ filename.cpp -o xxx.out  -lmysqlclient -lresolv
/// 注意连接数据库时的相关配置

#include <iostream>
#include <mysql/mysql.h>
using namespace std;

int main()
{
    // 定义数据库连接句柄
    MYSQL *conn;
    // 定义结果集对象
    MYSQL_RES *res;
    // 定义一行数据
    MYSQL_ROW row;

    // 初始化句柄
    conn = mysql_init(NULL);
    if (conn == NULL)
    {
        cout << "初始化失败" << endl;
        return 1;
    }

    // 连接到本地的MySQL服务器，使用root用户和56密码，选择test数据库
    conn = mysql_real_connect(conn, "localhost", "root", "password", "连接数据库名", 0, NULL, 0);
    if (conn == NULL)
    {
        cout << "连接失败" << endl;
        return 1;
    }

    // 设置字符集为utf8
    mysql_query(conn, "set names utf8");

    // 执行SQL语句，创建一个名为book的表，包含id, title, author, price四个字段
    string sql_create = "create table book(id int primary key, title varchar(50), author varchar(20), price float)";
    if (mysql_query(conn, sql_create.c_str()) == 0)
    {
        cout << "创建表成功" << endl;
    }
    else
    {
        cout << "创建表失败" << endl;
        return 1;
    }

    // 执行SQL语句，向book表中插入三条数据，分别是《C++ Primer》,《Effective C++》,《The C++ Programming Language》
    string sql_insert1 = "insert into book values(1, 'C++ Primer', 'Stanley B. Lippman', 79.8)";
    string sql_insert2 = "insert into book values(2, 'Effective C++', 'Scott Meyers', 49.9)";
    string sql_insert3 = "insert into book values(3, 'The C++ Programming Language', 'Bjarne Stroustrup', 99.9)";
    
    if (mysql_query(conn, sql_insert1.c_str()) == 0 && mysql_query(conn, sql_insert2.c_str()) == 0 && mysql_query(conn, sql_insert3.c_str()) == 0)
    {
        cout << "插入数据成功" << endl;
    }
    else
    {
        cout << "插入数据失败" << endl;
        return 1;
    }

    // 执行SQL语句，修改book表中的一条数据，将《Effective C++》的价格改为59.9
    string sql_update = "update book set price = 59.9 where id = 2";
    
    if (mysql_query(conn, sql_update.c_str()) == 0)
    {
        cout << "修改数据成功" << endl;
    }
    else
    {
        cout << "修改数据失败" << endl;
        return 1;
    }
    string sql_select = "select * from book";
    if (mysql_query(conn, sql_select.c_str()) == 0)
    {
        cout << "查询数据成功" << endl;
        // 获取结果集对象
        res = mysql_use_result(conn);
        cout << "ID\tTitle\tAuthor\tPrice" << endl;
        // 循环读取每一行数据
        while ((row = mysql_fetch_row(res)) != NULL)
        {
        // 打印每一列的值
            for (int i = 0; i < mysql_num_fields(res); i++)
            {
                cout << row[i] << "\t";
            }
            cout << endl;
        }
        // 释放结果集对象
        mysql_free_result(res);
    }
    else
    {
        cout << "查询数据失败" << endl;
        return 1;
    }

    // 执行SQL语句，删除book表中的一条数据，将《The C++ Programming Language》删除
    string sql_delete = "delete from book where id = 3";
    if (mysql_query(conn, sql_delete.c_str()) == 0)
    {
        cout << "删除数据成功" << endl;
    }
    else
    {
        cout << "删除数据失败" << endl;
        return 1;
    }

    // 再次查询book表中的所有数据，并打印出来
    if (mysql_query(conn, sql_select.c_str()) == 0)
    {
        cout << "查询数据成功" << endl;
        // 获取结果集对象
        res = mysql_use_result(conn);
        cout << "ID\tTitle\tAuthor\tPrice" << endl;
        // 循环读取每一行数据
        while ((row = mysql_fetch_row(res)) != NULL)
        {
        // 打印每一列的值
            for (int i = 0; i < mysql_num_fields(res); i++)
            {
                cout << row[i] << "\t";
            }
            cout << endl;
        }
        // 释放结果集对象
        mysql_free_result(res);
    }
    else
    {
        cout << "查询数据失败" << endl;
        return 1;
    }

    // 关闭数据库连接
    mysql_close(conn);

    return 0;
}

```

