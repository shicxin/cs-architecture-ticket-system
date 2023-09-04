#include <iostream>
#include <string>

#include "sonic/sonic.h"

using NodeType = sonic_json::Node;
using Allocator = typename NodeType::AllocatorType;
using member_itr_type = typename sonic_json::Document::MemberIterator;

void print_member(member_itr_type m) {
  const sonic_json::Node& key = m->name;
  sonic_json::Node& value = m->value;
  if (key.IsString()) {
    std::cout << "Key is: " << key.GetString() << std::endl;
  } else {
    std::cout << "Incoreect key type!\n";
    return;
  }
  if (value.IsInt64()) {
    std::cout << "Value is " << value.GetInt64() << std::endl;
  }
  else if(value.IsArray()) {std::cout << "Value is " << "array" << std::endl;}
  else if(value.IsObject()) {std::cout << "Value is " << "object" << std::endl;}
  else if(value.IsStringConst()) {std::cout << "Value is " << "object" << std::endl;}
  else std::cout << "not have value." << std::endl;


    sonic_json::Document doc;
auto& alloc = doc.GetAllocator();

doc.SetObject();
doc.AddMember("key1", NodeType(1), alloc);

{
  NodeType node;
  node.SetArray();
  doc.AddMember("key2", std::move(node), alloc);
}

sonic_json::WriteBuffer wb;
doc.Serialize(wb);
std::cout << wb.ToString() << std::endl; // {"key1": 1, "key2":[]}
  return;
}

void set_new_value(member_itr_type m) {
  sonic_json::Node& value = m->value;
  value.SetInt64(2);
  return;
}

int main()
{
  // NodeType node;
  // Allocator alloc;

  // node.SetObject();
  // node.AddMember("Key", NodeType("Value", alloc), alloc);
  // std::cout << "Add member successfully!\n";

  // auto x = node.FindMember("Key");
  // std::cout << "Before Setting new value:\n";
  //     print_member(x);

  // std::string json = R"(
  // {
  //     "a": 1,
  //     "b": 2
  //     }
  // )";

  // sonic_json::Document doc;
  // doc.Parse(json);

  // if (doc.HasParseError()) 
  // {
  //     std::cout << "Parse failed!\n";
  //     return -1;
  // }

  // // Find member by key
  // if (!doc.IsObject()) // Check JSON value type.
  // {  
  //     std::cout << "Incorrect doc type!\n";
  //     return -1;
  // }

  // auto m = doc.FindMember("a");
  // if (m != doc.MemberEnd()) 
  // {
  //   std::cout << "Before Setting new value:\n";
  //   print_member(m);
  //   std::cout << "After Setting value:\n";
  //   set_new_value(m);
  //   print_member(m);
  // } else {
  //     std::cout << "Find key doesn't exist!\n";
  // }

  // sonic_json::Node node_1(0.1);
  // if (node_1.IsDouble()) {
  //   std::cout << node_1.GetDouble() << std::endl;
  // }
  // node_1.SetDouble(1.0);
  // if (node_1.IsDouble()) {
  //   std::cout << node_1.GetDouble() << std::endl;
  // }

  sonic_json::Document doc;
  auto& alloc = doc.GetAllocator();

  doc.SetObject();
  doc.AddMember("key1", NodeType(1), alloc);

  {
    NodeType node;
    node.SetArray();
    node.PushBack(NodeType(1.0), alloc);
    doc.AddMember("key2", std::move(node), alloc);
    // node.AddMember("son_key1", NodeType(1), alloc);
    // node.PushBack(NodeType("admin"),alloc);
    // node.PushBack(NodeType(1),alloc);

  }

  sonic_json::WriteBuffer wb;
  doc.Serialize(wb);
  std::cout << wb.ToString() << std::endl; // {"key1": 1, "key2":[]}

  return 0;
}


/*

g++ -I../include/ -march=haswell --std=c++11 1.cpp -o 1

*/