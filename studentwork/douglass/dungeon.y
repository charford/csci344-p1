/* Dungeon */
%{
#include <stdio.h>
#include <iostream>
#include <vector>
#include <string>
#include "Dungeon.h"
#include "Room.h"
#include "Monster.h"
#include "Treasure.h"

Dungeon dun;
std::vector<Monster*> monsters;
std::vector<Treasure*> treasures;
int yylex( );
int yyerror( const char* s );
extern int yylineno;
%}

%union {
int myint;
char* mystring;
Room* rm;
Monster* monst;
Treasure* treas;
}

/* declare tokens */
%token <myint> NUMBER
%token <mystring> STRING_DATA
%token DESCRIPTION 
%token MONSTER 
%token HITS WEAPON
%token TREASURE
%token VALUE
%token ROOM
%token EOL 
%token STRING_DATA
%type <rm> a_room
%type <monst> a_monster
%type <treas> a_treasure

%%
 
file: room_s
   | file room_s
   ;

room_s: ROOM a_room { dun.add_room( *($2) ); delete $2; }
   ;

a_room: NUMBER EOL DESCRIPTION STRING_DATA { Monster* m = new Monster( "None", 0, "None" ); monsters.push_back( m );
                                             Treasure* t = new Treasure( "None", 0 ); treasures.push_back( t );
                                             std::string strd( $4 ); free( $4 );
                                             $$ = new Room( $1, strd, monsters, treasures ); 
                                             monsters.clear( ); treasures.clear( ); }
   | NUMBER EOL DESCRIPTION STRING_DATA EOL { Monster* m = new Monster( "None", 0, "None" ); monsters.push_back( m );
                                              Treasure* t = new Treasure( "None", 0 ); treasures.push_back( t );
                                              std::string strd( $4 ); free( $4 );
                                              $$ = new Room( $1, strd, monsters, treasures ); 
                                              monsters.clear( ); treasures.clear( ); }
   | NUMBER EOL DESCRIPTION STRING_DATA EOL EOL { Monster* m = new Monster( "None", 0, "None" ); monsters.push_back( m );
                                                  Treasure* t = new Treasure( "None", 0 ); treasures.push_back( t );
                                                  std::string strd( $4 ); free( $4 );
                                                  $$ = new Room( $1, strd, monsters, treasures );
                                                  monsters.clear( ); treasures.clear( ); }
   | NUMBER EOL DESCRIPTION STRING_DATA EOL info { std::string strd( $4 ); free( $4 ); 
                                                   $$ = new Room( $1, strd, monsters, treasures ); 
                                                   monsters.clear( ); treasures.clear( ); }
   ;

info: stuff
   | info stuff
   ;

stuff: a_monster { monsters.push_back( $1 ); }
   | a_treasure { treasures.push_back( $1 ); }
   ;

a_monster: MONSTER STRING_DATA EOL HITS NUMBER EOL WEAPON STRING_DATA { std::string strn( $2 ); free( $2 ); 
                                                                        std::string strw( $8 ); free( $8 );
     							                $$ = new Monster( strn, $5, strw ); }
   | MONSTER STRING_DATA EOL WEAPON STRING_DATA EOL HITS NUMBER { std::string strn( $2 ); free( $2 ); 
                                                                  std::string strw( $5 ); free( $5 );
						                  $$ = new Monster( strn, $8, strw ); }
   | MONSTER STRING_DATA EOL HITS NUMBER EOL WEAPON STRING_DATA EOL { std::string strn( $2 ); free( $2 );
                                                                      std::string strw( $8 ); free( $8 );
                                                                      $$ = new Monster( strn, $5, strw ); }
   | MONSTER STRING_DATA EOL WEAPON STRING_DATA EOL HITS NUMBER EOL { std::string strn( $2 ); free( $2 );
                                                                      std::string strw( $5 ); free( $5 );
                                                                      $$ = new Monster( strn, $8, strw ); }
   | MONSTER STRING_DATA EOL HITS NUMBER EOL WEAPON STRING_DATA EOL EOL { std::string strn( $2 ); free( $2 );
                                                                          std::string strw( $8 ); free( $8 );
                                                                          $$ = new Monster( strn, $5, strw ); }
   | MONSTER STRING_DATA EOL WEAPON STRING_DATA EOL HITS NUMBER EOL EOL { std::string strn( $2 ); free( $2 );
                                                                          std::string strw( $5 ); free( $5 );
                                                                          $$ = new Monster( strn, $8, strw ); }
   ;

a_treasure: TREASURE STRING_DATA EOL VALUE NUMBER { std::string strt( $2 ); free( $2 );
  					            $$ = new Treasure( strt, $5 ); }
   | TREASURE STRING_DATA EOL VALUE NUMBER EOL { std::string strt( $2 ); free( $2 );
                                                 $$ = new Treasure( strt, $5 ); }
   | TREASURE STRING_DATA EOL VALUE NUMBER EOL EOL { std::string strt( $2 ); free( $2 );
                                                     $$ = new Treasure( strt, $5 ); }
   ;

%%

int main()
{
    extern FILE* yyin;
    yyin = fopen("dungeon.txt", "r");

    yyparse();

    int choice = 0;
    int iters = 0;
    char get_choice;
    while( choice == 0 )
    {
        if( iters == 0 )
        {
            std::cout << std::string(60, '\n');
            iters++;
        }
        std::cout << "Would you like to (1) print the dungeon or (2) quit?\n\n";
        std::cin >> get_choice;
        if( get_choice == '1' )
        {
            std::cout << std::string(60, '\n');
            std::cout << dun << "\n\n\n";
            std::cin.clear( );
            std::cin.ignore( 500, '\n' );
        }
        else
        {
            if( get_choice == '2' )
            {
                std::cout << std::string(60, '\n');
                std::cout << "Goodbye.";
                std::cout << std::string(15, '\n');
                choice = 1;
            }
            else
            {
                std::cout << std::string(60, '\n');
                std::cout << "Please enter a valid input.\n\n\n";
                std::cin.clear( );
                std::cin.ignore( 500, '\n' );
            }
        }
    }
}

int yyerror(const char *s)
{
    fprintf(stderr, "\nerror: %s\nline: %d\n\n", s, yylineno);
}
