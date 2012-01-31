%{
#include <vector>
#include <stdio.h>
#include <iostream>
#include "room.h"
Dungeon D;
std::vector<Monster> M;
std::vector<Treasure> T;
int yylex();
int yyerror(const char* s);
%}

%union {
int myinteger;
char* mystring;
Room* rm;
Monster* mstr;
Treasure* trs;
}

%token <myinteger> RNUM
%token <mystring> RDESC
%token <mystring> MONSTER
%token <myinteger> HITS
%token <mystring> WEP
%token <mystring> TDESC
%token <myinteger> VAL
%type <rm> anyroom
%type <rm> room
%type <mstr> monster
%type <trs> treasure


%%

anyroom: room 					{D.addRoom(*$1);}
     | anyroom room 			{D.addRoom(*$2); M.clear(); T.clear();}

room: RNUM RDESC 				{std::string str($2); free($2); $$=new Room($1, str);}
	 | room stuff				{$1->addMonsterVector(M); $1->addTreasureVector(T);}

stuff: monster 					{M.push_back(*$1);}
     | treasure 				{T.push_back(*$1);}


monster: MONSTER HITS WEP {std::string str($1); free($1); std::string str1($3); free($3); $$=new Monster(str, str1, $2);}
       | MONSTER WEP HITS {std::string str($1); free($1); std::string str1($2); free($2); $$=new Monster(str, str1, $3);}
		 
treasure: TDESC VAL {std::string str($1); free($1); $$=new Treasure(str,$2);}

%%

main()
{
	extern FILE* yyin;
	// open a file handle to a particular file:
	FILE *myfile = fopen("dungeon.txt", "r");
	// make sure it's valid - would use if reading from cmd line but I didn't get there.
	if (!myfile) {
		std::cout << "error opening dungeon.txt" << std::endl;
		return -1;
	}

	// set lex to read from file:
	yyin = myfile;
	
	// parse  the input:
	yyparse();
	int option;
	
	while (option != 2)
	{	
		std::cout << "*** MAIN MENU *** \n\n"
				    << "1.  PRINT DUNGEON\n"
			       << "2.  QUIT\n\n";

		std::cout << "Please make a selection. -> ";
		std::cin >> option;

		if(!std::cin)
		{
			std::cin.clear();
			while(std::cin.peek() != '\n')
				std::cin.get();
			std::cin.get();
		}
			
		switch (option)
		{
			case 1: // Print Dungeon
				D.DungeonDisplay();
				break;

			case 2: // quit
				std::cout << "\n\n*** GOOD-BYE ***\n";
				break;

			default:
				std::cout << "PLEASE CHOOSE A VALID OPTION\n\n";
		}
	}
}

int yyerror(const char* s)
{
  fprintf(stderr, "error: %s\n", s);
}
