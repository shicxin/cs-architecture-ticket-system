

[toc]

# 使用准备

新开了一个`CPP`的项目，`cjson`感觉不是很适合`C++`的开发，于是在网上搜寻后选择了字节跳动开源的`Sonic-Cpp`json库。

`clone`项目完整文件后，于`dosc/usage.md`中了解到直接在项目中包含`include`文件夹即可，直接上手测试。

# 文件包含内容分析

```
卷 新加卷 的文件夹 PATH 列表
卷序列号为 CC82-BFDC
D:.
|   tree.txt
|   
+---sonic
|   |   allocator.h     //定义了 sonic_json::Allocator 类，用于内存分配和释放。
|   |   error.h			//定义了 sonic_json::Error 类，用于表示 JSON 解析或序列化过程中的错误信息。
|   |   macro.h			//定义了一些宏，用于控制编译选项和调试信息。
|   |   sonic.h			//主要头文件，包含了所有的 API 函数和类，用户只需要包含这个头文件就可以使用 sonic-cpp。
|   |   string_view.h	//定义了 sonic_json::StringView 类，用于表示一个不可变的字符串视图，可以避免字符串的复制和分配。
|   |   writebuffer.h	//定义了 sonic_json::WriteBuffer 类，用于缓冲 JSON 序列化的输出。
|   |   
|   +---dom				//包含了与 JSON 文档对象模型（DOM）相关的类和函数。
|   |       dynamicnode.h	//定义了 sonic_json::DynamicNode 类，用于表示一个动态类型的 JSON 值。
|   |       flags.h			//定义了一些标志位，用于表示 JSON 值的类型和状态。
|   |       genericnode.h	//定义了 sonic_json::GenericNode 类，用于表示一个泛型的 JSON 值，可以是任何类型。
|   |       generic_document.h	//定义了 sonic_json::GenericDocument 类，用于表示一个泛型的 JSON 文档，可以包含任何类型的值。
|   |       handler.h		//定义了 sonic_json::Handler 类，用于处理 JSON 解析或序列化过程中的事件。
|   |       json_pointer.h	//定义了 sonic_json::JsonPointer 类，用于实现 RFC 6901 中定义的 JSON 指针功能，可以通过一个字符串来定位 JSON 文档中的某个值。
|   |       parser.h		//定义了 sonic_json::Parser 类，用于实现 JSON 的反序列化功能，可以把一个字符串解析为一个文档对象。
|   |       serialize.h		//定义了 sonic_json::Serialize 类，用于实现 JSON 的序列化功能，可以把一个文档对象转换为一个字符串。
|   |       type.h			//定义了一些枚举类型，用于表示 JSON 值的类型。
|   |       
|   +---experiment			//包含了一些实验性的功能和类。
|   |       lazy_update.h
|   |       
|   \---internal		//包含了一些内部使用的类和函数，不对外暴露。
|       |   atof_native.h		//实现了一个原生的字符串转浮点数的函数，用于在不支持 SIMD 指令集的平台上解析浮点数。
|       |   ftoa.h			//实现了一个浮点数转字符串的函数，用于序列化浮点数。
|       |   itoa.h			//实现了一个整数转字符串的函数，用于序列化整数。
|       |   parse_number_normal_fast.h	//实现了一个快速解析数字的函数，用于在支持 SIMD 指令集的平台上解析数字。
|       |   stack.h			//实现了一个栈结构，用于在解析过程中存储临时数据。
|       |   utils.h			//实现了一些工具函数，用于处理字符串、字符、位操作等。
|       |   
|       \---arch		//包含了一些针对不同架构和指令集的优化代码。
|           |   
|           +---avx2
|           |       
|           +---common
|           |   |   
|           |   \---x86_common
|           |           
|           +---neon
|           |       
|           +---sse
|           |       
|           \---x86_ifuncs
|                   
\---thirdparty			//包含了一些第三方的库，用于提供一些基础的功能。
    |   .clang-format	//是一个用于格式化代码风格的配置文件，可以配合 clang-format 工具使用。
    |   
    \---string-view-lite	//包含了一个轻量级的 string_view 库，用于提供一个不可变的字符串视图，可以避免字符串的复制和分配。
           
```

# 主要使用的文件分析

## sonic.h

该文件是`Sonic-Cpp`的主要文件，向我们表明了库版本信息、命名空间，并表明该库的实现依赖于`sonic/dom/dynamicnode.h`与`sonic/dom/generic_document.h`的定义。

## sonic/dom/dynamicnode.h

## sonic/dom/generic_document.h



# 直接上手

##  我们需要什么功能

1.   字符串与json对象的相互转换；
2.   从JSON对象中解析某个特定的元素。

## 解析一个json字符

```c++
#include "sonic/sonic.h"

#include <string>
#include <iostream>

int main()
{
  std::string json = R"(
    {
      "a": 1,
      "b": 2
    }
  )";

  sonic_json::Document doc;
  doc.Parse(json);

  sonic_json::WriteBuffer wb;
  doc.Serialize(wb);
  std::cout << wb.ToString() << std::endl;
}
// g++ -I./include/ -march=haswell --std=c++11 -O3 example/parse_and_serialize.cpp -o example/parse_and_serialize
```

上述代码为官方提供的代码之一，我们可以发现对于`sonic_json::Document`类有方法`parse( string& )`、`Serialize( WriteBuffer& )`
