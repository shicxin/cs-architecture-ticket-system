cmake_minimum_required(VERSION 3.0)
# 项目名称以及版本
project(muduo VERSION 1.0)
# 使用C++11版本
set(CMAKE_CXX_STANDARD 11)

# 指定输出位置  绝对路劲
set(HOME "/home/md/dev/ticket-system/test/muduo网络模块")
set(EXECUTABLE_OUTPUT_PATH ${HOME}/bin)

# 包含头文件路径
include_directories(${HOME}/include)

# 包含源文件
file(GLOB muduo_CPP ${HOME}/src/*.cpp)

# 包含静态库
# # 包含路径
# # link_directories(<lib path>)
# link_libraries(<static lib> [<static lib>...])
# 参数1：指定出要链接的静态库的名字
# 可以是全名 libxxx.a
# 也可以是掐头（lib）去尾（.a）之后的名字 xxx
# 参数2-N：要链接的其它静态库的名字

# 包含动态库
# target_link_libraries(
#     <target> 
#     <PRIVATE|PUBLIC|INTERFACE> <item>... 
#     [<PRIVATE|PUBLIC|INTERFACE> <item>...]...)
# # target：指定要加载动态库的文件的名字
# # 该文件可能是一个源文件
# # 该文件可能是一个动态库文件
# # 该文件可能是一个可执行文件
# # PRIVATE|PUBLIC|INTERFACE：动态库的访问权限，默认为PUBLIC
# # 如果各个动态库之间没有依赖关系，无需做任何设置，三者没有没有区别，一般无需指定，使用默认的 PUBLIC 即可。
# # 动态库的链接具有传递性，如果动态库 A 链接了动态库B、C，动态库D链接了动态库A，此时动态库D相当于也链接了动态库B、C，并可以使用动态库B、C中定义的方法。
# # PUBLIC：在public后面的库会被Link到前面的target中，并且里面的符号也会被导出，提供给第三方使用。
# # PRIVATE：在private后面的库仅被link到前面的target中，并且终结掉，第三方不能感知你调了啥库
# # INTERFACE：在interface后面引入的库不会被链接到前面的target中，只会导出符号。

# 打印消息
# 输出一般日志信息
message(STATUS "source path: ${PROJECT_SOURCE_DIR}")
# 输出警告信息
message(WARNING "source path: ${PROJECT_SOURCE_DIR}")
# 输出错误信息
message(FATAL_ERROR "source path: ${PROJECT_SOURCE_DIR}")


# 编译
add_executable(muduo_server ${muduo_CPP})