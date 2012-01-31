#ifndef TREASURE_H
#define TREASURE_H
#include <string>
class Treasure 
{
public:
	int value;
	std::string type;
	Treasure(const std::string& t, int v) : type(t), value(v) {}

	friend std::ostream& operator<<(std::ostream& out, Treasure& t)
	{
		out << "<Treasure>" << std::endl;
		out << "Type: " << t.type << std::endl;
		out << "Value: " << t.value << std::endl;
		out << "</Treasure>" << std::endl;
		return out;
	}
};
#endif
