cmake_minimum_required(VERSION 3.9) #最低版本

project(ticket-sys VERSION 1.0) #项目名称及自定义版本号
add_executable(hello_cmake main.cpp) #添加生成可执行文件

# 添加头文件搜索路径
target_include_directories(hello_cmake PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

# 添加库文件搜索路径

# 添加多个源文件
# file(GOLB_RECURSE SRC_FILES src/*.cpp)
# add_executable(hello ${SRC_FILES})

