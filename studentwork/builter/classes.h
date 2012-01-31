//classes.h // Zachary Builter // 
#ifndef CLASSES_H
#define CLASSES_H
#include <string>
#include <vector>
#include <iostream>
#include <algorithm>
class MonsterObject {
 private:
  int hits;
  std::string name;
  std::string weapon;
 public:
   MonsterObject(int h, const std::string& n, const std::string& w) : hits(h), name(n), weapon(w) {}
   void print() {std::cout << "  Monster: " << name << "\n   Weapon: " << weapon << "\n   Hits: " << hits << std::endl;}
};

class MonsterList {
 public:
  std::vector<MonsterObject> v;
  MonsterList() {};
};

class TreasureObject {
 private:
  int value;
  std::string text;
 public:
  TreasureObject(int x, const std::string& y) : value(x), text(y) {}
  void print() {std::cout << "  Treasure: " << text << std::endl << "   Value: " << value << std::endl;}
};

class TreasureList {
 public:
  std::vector<TreasureObject> v;
  TreasureList() {};
};

class MonTre {
 public:
  MonTre() {}
  void add_tre(TreasureObject& x) {t.push_back(x);}
  void add_mon(MonsterObject& y) {m.push_back(y);}
  std::vector<TreasureObject> t;
  std::vector<MonsterObject> m;
};

class Room {
 private:
   int number;
   std::string description;
   std::vector<TreasureObject> TreasureList;
   std::vector<MonsterObject> MonsterList;
 public:
   Room(int x, std::string y, std::vector<TreasureObject> t, std::vector<MonsterObject> z) : number(x), description(y), TreasureList(t), MonsterList(z) {}
   Room(int x, std::string y) : number(x), description(y) {}
   void print() {std::cout << "Room: " << number << std::endl << " Description: " << description << std::endl; for(int i=0; i<TreasureList.size(); i++) {TreasureList[i].print();} for(int i=0; i<MonsterList.size(); i++) {MonsterList[i].print();} std::cout << std::endl;}
   friend bool operator < (const Room& r1, const Room& r2) {return r1.number < r2.number;}

};
class Dungeon {
 private:
   int number_of_rooms; //not sure if I need this or not
   std::vector<Room> room_list;
 public:
   Dungeon() {number_of_rooms = 0;}
   void add_room(const Room& r) {number_of_rooms++; room_list.push_back(r);}
   void print() {std::sort(room_list.begin(), room_list.end()); for(int i=0; i<room_list.size(); i++) {room_list[i].print();}};
};
#endif
