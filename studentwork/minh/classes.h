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
	void print() {std::cout << "	Monster: " << name << "\n		Weapon: " << weapon << "\n		Hits: " << hits << std::endl;}
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
	TreasureObject(int v, const std::string& t) : value(v), text(t) {}
	void print() {std::cout << "	Treasure: " << text << std::endl << "		Value: " << value << std::endl;}
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
	Room(int n, std::string d, std::vector<TreasureObject> t, std::vector<MonsterObject> m) : number(n), description(d), TreasureList(t), MonsterList(m) {}
	Room(int n, std::string d) : number(n), description(d) {}
	void print() {std::cout << "Room: " << number << std::endl << "	Description: " 
		<< description << std::endl << std::endl; 
		for(int i=0; i<TreasureList.size(); i++) 
			TreasureList[i].print();
		for(int i=0; i<MonsterList.size(); i++)
			MonsterList[i].print();
		std::cout << std::endl;}

	friend bool operator < (const Room& r1, const Room& r2) {return r1.number < r2.number;}
};

class Dungeon {
private:
	int numrooms;
	std::vector<Room> rlist;
public:
	Dungeon() {numrooms = 0;}
	void add_room(const Room& r) {numrooms++; rlist.push_back(r);}
	void print() {std::sort(rlist.begin(), rlist.end()); for(int i=0; i<rlist.size(); i++) {rlist[i].print();}};
};

#endif
