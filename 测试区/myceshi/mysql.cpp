#include "mysql.h"
#include <iostream>
using namespace std;
 
int main() {
  MYSQL *conn_mysql;
  // 初始化连接
  conn_mysql = mysql_init(NULL);
  if (!conn_mysql) {
    fprintf(stderr, "Mysql初始化连接失败\n");
    return(EXIT_FAILURE);
  }

  // 参数分别为：初始化的连接句柄指针，主机名（或者IP），用户名，密码，数据库名，端口号，NULL，0）后面两个参数在默认安装mysql>的情况下不用改
  conn_mysql = mysql_real_connect(conn_mysql, "127.0.0.1", "root", "123456", "test_c", 3306, NULL, 0);
  if (conn_mysql){
    printf( "连接成功！\n" );
  }
  else{
    printf( "连接失败！\n" );
  }

  // 关闭数据库连接
  mysql_close(conn_mysql); 
  return(EXIT_SUCCESS);
}
