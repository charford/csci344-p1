// Julie Anderson
// class definitions

#ifndef _room
#define _room

#include <string>
#include <vector>
#include <iostream>
#include <algorithm>


class Monster
{
public:
	Monster(const std::string& d, std::string& w, int h) : m_desc(d), hits(h), weapon(w) {}
	~Monster() {};
	void MonsterDisplay();

private:
	std::string m_desc;
	int hits;
	std::string weapon;
};



class Treasure
{
public:
	Treasure(const std::string& d, int v) : t_desc(d), value(v) {}
	void TreasureDisplay(); 

private:
	std::string t_desc;
	int value;
};



class Room
{
public:
	Room(){}
	Room(const int n, const std::string& d) : room_num(n), desc(d) {}
	void addMonster(const Monster m) {monst.push_back(m);}
	void addTreasure(const Treasure t) {treas.push_back(t);}
	void addMonsterVector(const std::vector<Monster> m) {monst = m;}
	void addTreasureVector(const std::vector<Treasure> t) {treas = t;}

	friend bool operator < (const Room& lhs, const Room& rhs) {return (lhs.room_num < rhs.room_num);}

	void Display() ;

private:
	int room_num;
	std::string desc;
	std::vector<Monster> monst;
	std::vector<Treasure> treas;
};



class Dungeon
{
	public:
	Dungeon(){}
	~Dungeon(){}
	void addRoom(const Room& r) {list.push_back(r);}
	void DungeonDisplay();
	
	private:
	std::vector<Room> list;
};












#endif 
