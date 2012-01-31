#ifndef ROOM_H
#define ROOM_H
#include <string>
#include <vector>
#include <iostream>
#include "Treasure.h"
#include "Monster.h"
class Room 
{
public:
	int number;
	std::string description;
	std::vector<Monster*> monsters;
	std::vector<Treasure*> treasures;
	Room(int n, const std::string& d) : number(n), description(d){}

	friend std::ostream& operator<<(std::ostream& out, Room& r)
	{
		out << "<Room>" << std::endl;
		out << "Number: " << r.number << std::endl;
		out << "Description: " << r.description << std::endl;
		out << "<Monsters>" << std::endl;
		for(int i = 0; i < r.monsters.size(); ++i)
		{
			out << *(r.monsters[i]) << std::endl;
		}
		out << "</Monsters>" << std::endl;
		out << "<Treasures>" << std::endl;
		for(int i = 0; i < r.treasures.size(); ++i)
		{
			out << *(r.treasures[i]) << std::endl;
		}
		out << "</Treasures>" << std::endl;
		out << "</Room>" << std::endl;
		return out;
	}
};
#endif
