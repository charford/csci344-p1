// Author: Patrick Douglass
// CSC 3415, Fall 2011
// Dungeon.cpp
// Implementation for the Dungeon class.

#include <iostream>
#include <vector>
#include <algorithm>
#include "Dungeon.h"
#include "Room.h"

Dungeon::~Dungeon( )
{
}

std::ostream& operator <<( std::ostream& outs, const Dungeon& dngn )
{
    std::vector<Room> sorted = dngn.rooms;

    // The one-line use of <algorithm>
    std::sort( sorted.begin( ), sorted.end( ) );

    // Display Rooms
    for( int i = 0; i < sorted.size( ); i++ )
    {
        outs << sorted[ i ];
        outs << "\n";
    }
    return outs;
}
