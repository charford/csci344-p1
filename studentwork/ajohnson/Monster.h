#ifndef MONSTER_H
#define MONSTER_H
#include <string>
#include <iostream>
class Monster 
{
public:
	int hits;
	std::string name;
	std::string weapon;
	Monster(const std::string& n, const std::string& w, int h) : name(n), weapon(w), hits(h) {}

	friend std::ostream& operator<<(std::ostream& out, Monster& m)
	{
		out << "<Monster>" << std::endl;
		out << "Name: " << m.name << std::endl;
		out << "Weapon: " << m.weapon << std::endl;
		out << "Hits: " << m.hits << std::endl;
		out << "</Monster>" << std::endl;
		return out;
	}
};
#endif
