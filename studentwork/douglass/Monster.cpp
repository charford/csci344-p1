// Author: Patrick Douglass
// CSC 3415, Fall 2011
// Monster.cpp
// Implementation for the Monster class.

#include <iostream>
#include "Monster.h"

Monster::Monster( std::string nam, int hp, std::string weap )
{
    name = nam;
    hits = hp;
    weapon = weap;
}

std::ostream& operator <<( std::ostream& outs, const Monster& mon )
{
    outs << mon.name << "\n";
    outs << "    Hits: " << mon.hits << "\n";
    outs << "    Weapon: " << mon.weapon << "\n";
    return outs;
}
