%{
#include <vector>
#include <stdio.h>
#include "classes.h"

int yylex();
int yyerror(const char* s);
Dungeon mydun;
%}

%union {
int myinteger;
char* mystring;
TreasureObject* tre;
MonsterObject* mon;
Room* roo;
MonTre* mat;
Dungeon* dun;
}

%token <myinteger> VALUE
%token <mystring> TREASURE
%token <myinteger> HITS
%token <mystring> WEAPON
%token <mystring> MONSTER
%token <myinteger> ROOM
%token <mystring> DESCRIPTION

%type <tre> treasureobj
%type <mon> monsterobj
%type <roo> roomobj
%type <mat> monsterandtreasure
%type <dun> dungeon

%%

dungeon: roomobj {mydun.add_room(*$1); delete($1);}
	| dungeon roomobj {mydun.add_room(*$2); delete($2);}

roomobj: ROOM DESCRIPTION monsterandtreasure {$$ = new Room($1,$2,$3->t,$3->m); free($2); delete($3);}
	| ROOM DESCRIPTION {$$ = new Room($1,$2); free($2);}

monsterandtreasure: monsterobj {$$ = new MonTre(); $$->add_mon(*$1); delete($1);}
	| treasureobj {$$ = new MonTre(); $$->add_tre(*$1); delete($1);}
	| monsterandtreasure monsterobj {$1->add_mon(*$2); delete($2);}
	| monsterandtreasure treasureobj {$1->add_tre(*$2); delete($2);}

monsterobj : MONSTER HITS WEAPON {$$ = new MonsterObject($2,$1,$3); free($1); free($3);}
	| MONSTER WEAPON HITS {$$ = new MonsterObject($3,$1,$2); free($1); free($2);}

treasureobj : TREASURE VALUE {$$ = new TreasureObject($2,$1); free($1);}

%%

main(int argc, char *argv[])
{
	extern FILE *yyin;
	FILE *fp=fopen(argv[1],"r");
	yyin=fp;
	yyparse();
	int exit = 0;
	while (exit == 0)
	{
		std::cout << "Main Dungeon Menu:\n" << "1) Print the Dungeon\n" << "2) Exit\n" << "(Type number and then hit <ENTER>) -> ";
		int selection;
		std::cin >> selection;
		if (selection == 1)
		mydun.print();
		if (selection == 2)
		exit = 1;
	}
	std::cout << "\nThank you for using the program!\n\n";
}

int yyerror(const char* s)
{fprintf(stderr, "There was an error: %s\n", s);}
