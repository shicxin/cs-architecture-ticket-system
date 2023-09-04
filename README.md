# 项目的整体规划

项目暂时被划分为三个阶段。

**第一阶段**

将实现一个简易的基于线程的CS服务器，深入学习线程的使用

**第二阶段**

学习线程池、优化数据库表设计、补充用户需求，使项目大概接近于2011年的12306的`TPS`

**第三阶段**

将分析高并发的提高思路，分小阶段实现更高的并发

# 项目的一些细节

在第一阶段，项目使用的技术栈为C++11，Linux系统编程、MySQL、开源库：Sonic-Cpp。

在第二阶段，项目将融入QT设计windows客户端。

第三阶段，项目将考虑多方面优化。

## 使用面向对象编程的思想来设计程序

## 使用MySQL保存数据

## 使用Sonic-Cpp JSON库作为程序内外部的信息沟通方式

1.   JSON对象创建
2.   JSON对象中添加对象
3.   JSON对象中删除对象
4.   JSON对象与字符串的转换

## 第一阶段项目细节 