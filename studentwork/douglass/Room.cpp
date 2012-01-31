// Author: Patrick Douglass
// CSC 3415, Fall 2011
// Room.cpp
// Implementation for the Room class.

#include <iostream>
#include <vector>
#include "Room.h"

Room::Room( int num, std::string descrip, std::vector<Monster> monsts, std::vector<Treasure> treas )
{
    number = num;
    description = descrip;
    monsters = monsts;
    treasures = treas;
}

Room::Room( int num, std::string descrip, std::vector<Monster*> monsts, std::vector<Treasure*> treas )
{
    number = num;
    description = descrip;
    Monster m;
    Treasure t;
    std::vector<Monster> mo;
    std::vector<Treasure> tr;
    for( int i = 0; i < monsts.size( ); i++ )
    {
        m.set_hits( monsts[ i ]->get_hits( ) );
        m.set_name( monsts[ i ]->get_name( ) );
        m.set_weapon( monsts[ i ]->get_weapon( ) );
        mo.push_back( m );
    }
    for( int i = 0; i < treas.size( ); i++ )
    {
        t.set_type( treas[ i ]->get_type( ) );
        t.set_value( treas[ i ]->get_value( ) );
        tr.push_back( t );
    }
    monsters = mo;
    treasures = tr;
    for( int i = 0; i < monsts.size( ); i++ )
    {
        delete monsts[ i ];
    }
    for( int i = 0; i < treas.size( ); i++ )
    {
        delete treas[ i ];
    }
}

Room::~Room( )
{
}

bool operator <( const Room& r1, const Room& r2 )
{
    if( r1.number < r2.number )
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

std::ostream& operator <<( std::ostream& outs, const Room& rm )
{
    outs << "Room: " << rm.number << "\n";
    outs << "  XXXXXiption: " << rm.description << "\n";
    for( int i = 0; i < rm.monsters.size( ); i++ )
    {
        if( rm.monsters[ i ].get_name( ) == "None" )
        {

        }
        else
        {
            outs << "  Monster: " << rm.monsters[ i ];
        }
    }
    for( int i = 0; i < rm.treasures.size( ); i++ )
    {
        if( rm.treasures[ i ].get_type( ) == "None" )
        {

        }
        else
        {
            outs << "  Treasure: " << rm.treasures[ i ];
        }
    }
    return outs;
}
