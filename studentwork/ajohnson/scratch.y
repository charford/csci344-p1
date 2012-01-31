%{
#include <vector>
#include <fstream>
#include <iostream>
#include <algorithm>
#include "Room.h"
#include "Monster.h"
#include "Treasure.h"
std::vector<Room*> rooms;
int yylex();
int yyerror(const char* s);
%}

%union {
int myinteger;
char* mystring;
Monster* monster;
Treasure* treasure;
Room* room;
void* any;
}

%token <myinteger> VALUE;
%token <myinteger> ROOM;
%token <myinteger> HITS;
%token <mystring> MONSTER;
%token <mystring> TREASURE;
%token <mystring> WEAPON;
%token <mystring> DESCRIPTION;
%type <monster> monster;
%type <treasure> treasure;
%type <room> room;
%type <any> any;

%%

any:	monster {rooms.back()->monsters.push_back($1); }
	| any monster {rooms.back()->monsters.push_back($2); }
	| treasure {rooms.back()->treasures.push_back($1); }
	| any treasure {rooms.back()->treasures.push_back($2); }
	| room {rooms.push_back($1); }
	| any room {rooms.push_back($2); }


room:	ROOM DESCRIPTION  {$$=new Room($1,$2); free($2);}

monster:	MONSTER WEAPON HITS {$$=new Monster($1,$2,$3); free($1); free($2); }
		| MONSTER HITS WEAPON {$$=new Monster($1,$3,$2); free($1); free($3); }

treasure:	TREASURE VALUE {$$=new Treasure($1,$2); free($1);}

%%

extern FILE *yyin, *yyout;

bool roomsort(Room* i, Room* j) { return i->number < j->number; }

int main(int argc, char* argv[])
{
	if(argc > 1)
		yyin = fopen(argv[1], "r");

	char input;
	std::cout << "Menu" << std::endl;
	std::cout << "(1) Display Dungeon" << std::endl;
	std::cout << "(2) Quit" << std::endl;
	std::cin >> input;
	if(input == '1')
	{
		yyparse();
		std::sort(rooms.begin(), rooms.end(), roomsort);
 		for(int i = 0; i < rooms.size(); ++i)
		{
			std::cout << *rooms[i] << std::endl;
		}
	}
	return 0;
}

int yyerror(const char* s)
{
	std::cerr << s << std::endl;
}
