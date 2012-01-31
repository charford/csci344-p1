%{
#include <vector>
#include <stdio.h>
#include "classes.h"
int yylex();
int yyerror(const char* s);
Dungeon d;
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

dungeon: roomobj {d.add_room(*$1); delete($1);}
	| dungeon roomobj {d.add_room(*$2); delete($2);}

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
    std::cout << "Menu: (type the number of menu choice and hit enter to continue)\n1) Print Dungeon\n2) Exit\n--> ";
    int menuchoice;
    std::cin >> menuchoice;
    if (menuchoice == 1)
      d.print();
    if (menuchoice == 2)
      exit = 1;
  }
}

int yyerror(const char* s)
{
  fprintf(stderr, "error: %s\n", s);
}
