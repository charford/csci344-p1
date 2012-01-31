// Author: Patrick Douglass
// CSC 3415, Fall 2011
// Room.h
// Interface for the Room class.

#ifndef ROOM_H
#define ROOM_H

#include <string>
#include <vector>
#include <iostream>
#include "Monster.h"
#include "Treasure.h"

// PRE:  None.
// POST: An instance of the room class has been constructed
//       using the default of one for the number and all empty
//       strings for the other member variables.

// PRE:  None.
// POST: An instance of the room class has been constructed
//       using user-specified values.

class Room
{
public:

    // Constructors
    Room( ):number( 1 ), description( "None" ) { };
    Room( int, std::string, std::vector<Monster>, std::vector<Treasure> );
    Room( int, std::string, std::vector<Monster*>, std::vector<Treasure*> );

    // Destructor
    ~Room( );

    // Get-em Functions
    int get_number( ) const { return number; };
    std::string get_description( ) const { return description; };
    std::vector<Monster> get_monsters( ) const { return monsters; };
    std::vector<Treasure> get_treasures( ) const { return treasures; };

    // Overloaded Operators
    friend bool operator <( const Room&, const Room& );
    friend std::ostream& operator <<( std::ostream&, const Room& );

private:
    int number;
    std::string description;
    std::vector<Monster> monsters; 
    std::vector<Treasure> treasures;
};
#endif
