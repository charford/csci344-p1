// Author: Patrick Douglass
// CSC 3415, Fall 2011
// Monster.h
// Interface for the Monster class.

#ifndef MONSTER_H
#define MONSTER_H

#include <string>
#include <iostream>

// PRE:  None.
// POST: An default instance of the Monster class has been constructed.
//       

// PRE:  None.
// POST: An instance of the room class has been constructed
//       using user-specified values.

class Monster
{
public:

    // Constructors
    Monster( ):name( "None" ), hits( 5 ), weapon( "None" ) { };
    Monster( std::string, int, std::string );

    // Get-ems
    int get_hits( ) const { return hits; };
    std::string get_name( ) const { return name; };
    std::string get_weapon( ) const { return weapon; };

    // Set-ems
    void set_hits( int h ) { hits = h; };
    void set_name( std::string n ) { name = n; };
    void set_weapon( std::string w ) { weapon = w; }; 

    // Overloaded Operators
    friend std::ostream& operator <<( std::ostream&, const Monster& );

private:
    int hits;
    std::string name, weapon;
};
#endif
