// #include <iostream>
// #include <string>

// #include "sonic/sonic.h"

// using NodeType = sonic_json::Node;
// using Allocator = typename NodeType::AllocatorType;
// using member_itr_type = typename sonic_json::Document::MemberIterator;

// void print_member(member_itr_type m) {
//   const sonic_json::Node& key = m->name;
//   sonic_json::Node& value = m->value;
//   if (key.IsString()) {
//     std::cout << "Key is: " << key.GetString() << std::endl;
//   } else {
//     std::cout << "Incoreect key type!\n";
//     return;
//   }
//   if (value.IsInt64()) {
//     std::cout << "Value is " << value.GetInt64() << std::endl;
//   }
//   else if(value.IsArray()) {std::cout << "Value is " << "array" << std::endl;}
//   else if(value.IsObject()) {std::cout << "Value is " << "object" << std::endl;}
//   else if(value.IsStringConst()) {std::cout << "Value is " << "object" << std::endl;}
//   else std::cout << "not have value." << std::endl;


//     sonic_json::Document doc;
// auto& alloc = doc.GetAllocator();

// doc.SetObject();
// doc.AddMember("key1", NodeType(1), alloc);

// {
//   NodeType node;
//   node.SetArray();
//   doc.AddMember("key2", std::move(node), alloc);
// }

// sonic_json::WriteBuffer wb;
// doc.Serialize(wb);
// std::cout << wb.ToString() << std::endl; // {"key1": 1, "key2":[]}
//   return;
// }

// void set_new_value(member_itr_type m) {
//   sonic_json::Node& value = m->value;
//   value.SetInt64(2);
//   return;
// }

// int main()
// {
//   sonic_json::Document doc;
//   auto& alloc = doc.GetAllocator();
//   doc.SetObject();
//   doc.AddMember("key1", NodeType(1), alloc);
//   {
//     NodeType node;
//     node.SetArray();
//     node.PushBack(NodeType(1.0), alloc);
//     doc.AddMember("key2", std::move(node), alloc);
//     node.SetArray();
//     node.PushBack(NodeType("字符串"), alloc);
//     doc.AddMember("key3", std::move(node), alloc);
//     node.SetObject();
//     node.AddMember("key_sson", NodeType((int)1), alloc);
//     node.AddMember("son_key1", NodeType("123"), alloc);
//     doc.AddMember("ks", std::move(node), alloc);
//     // node.AddMember("son_key1", NodeType(1), alloc);
//     // node.PushBack(NodeType("admin"),alloc);
//     // node.PushBack(NodeType(1),alloc);

//   }

//   sonic_json::WriteBuffer wb;
//   doc.Serialize(wb);
//   std::cout << wb.ToString() << std::endl; // {"key1": 1, "key2":[]}

//   return 0;
// }

#include <iostream>
#include <string>

#include "sonic/sonic.h"

void parse_json(const std::string& data) {
  sonic_json::Document doc;
  doc.Parse(data);
  if (doc.HasParseError()) {
    std::cout << sonic_json::ErrorMsg(doc.GetParseError()) << std::endl
        << "Json: \n" << data << std::endl
        << "Error offset is: " << doc.GetErrorOffset() << std::endl;
  } else {
    std::cout << "Parse json:\n" << data << "\n successfully";
  }
}


/*

g++ -I../include/ -march=haswell --std=c++11 1.cpp -o 1

*/