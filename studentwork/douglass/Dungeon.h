// Author: Patrick Douglass
// CSC 3415, Fall 2011
// Dungeon.h
// Interface for the Dungeon class.

#ifndef DUNGEON_H
#define DUNGEON_H

#include <iostream>
#include <vector>
#include "Room.h"

// PRE:  None.
// POST: An instance of the Dungeon class has been constructed.

// PRE:  None.
// POST: A Room object has been added to the dungeon.

class Dungeon
{
public:

    // Constructor
    Dungeon( ) { };

    // Destructor
    ~Dungeon( );

    // Non-constant Member Function
    void add_room( const Room& new_room ) { rooms.push_back( new_room ); };

    // Overloaded Operator
    friend std::ostream& operator <<( std::ostream&, const Dungeon& );

private:
    std::vector<Room> rooms;
};
#endif
