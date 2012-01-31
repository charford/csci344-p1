// Author: Patrick Douglass
// CSC 3415, Fall 2011
// Treasure.h
// Interface for the Treasure class.

#ifndef TREASURE_H
#define TREASURE_H

#include <string>
#include <iostream>

// PRE:  None.
// POST: An instance of the Treasure class has been constructed
//       using the default values.
//

// PRE:  None.
// POST: An instance of the treasure class has been constructed
//       using user-specified values.

class Treasure
{
public:

    // Constructors
    Treasure( ):type( "None" ), value( 0 ) { };
    Treasure( std::string, int );

    // Get-ems
    std::string get_type( ) const { return type; };
    int get_value( ) const { return value; };

    // Set-ems
    void set_type( std::string t ) { type = t; };
    void set_value( int v ) { value = v; };

    // Overloaded Operators
    friend std::ostream& operator <<( std::ostream&, const Treasure& );

private:
    std::string type;
    int value;
};
#endif
