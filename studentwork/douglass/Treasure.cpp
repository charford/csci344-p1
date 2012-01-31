// Author: Patrick Douglass
// CSC 3415, Fall 2011
// Treasure.cpp
// Implementation for the Treasure class.

#include <iostream>
#include "Treasure.h"

Treasure::Treasure( std::string typ, int val )
{
    type = typ;
    value = val;
}

std::ostream& operator <<( std::ostream& outs, const Treasure& treas )
{
    outs << treas.type << "\n";
    outs << "    Value: " << treas.value << "\n";
    return outs;
}
