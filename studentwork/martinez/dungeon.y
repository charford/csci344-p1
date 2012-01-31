%{
#include <vector>
#include <stdio.h>
#include <iostream>
#include <string>
#include "Room.h"

using namespace std;

// Dungeon class dungeon
Dungeon myDungeon;

// Temporary variables. 
std::vector<Room> dungeon;
int int_tempRoom = -1;
int int_tempHits = 0;
int int_tempValue = 0;
std::string str_tempRoom = "N/A";
std::string str_tempDescription = "N/A";
std::string str_tempMonster = "N/A";
std::string str_tempWeapon = "N/A";
std::string str_tempHits = "N/A";
std::string str_tempTreasure = "N/A";
std::string str_tempValue = "N/A";
std::string str_colon = ":";
int temp_pos;

// Temporary objects and containers. 
std::vector<Monster> tempMonster;
std::vector<Treasure> tempTreasure;
Room myRoom;
Monster myMonster;
Treasure myTreasure;

int yylex();
int yyerror(const char* s);
%}

%union {
int myinteger;
char* mystring;
Room* dun;
}


%{
  // The file is basically read line by line and rooms are stored
  // the moment a new room is found. For the last room, the "End" 
  // token is used to help store that room. 
%}

%token <mystring> ROOM
%token <mystring> DESCRIPTION
%token <mystring> MONSTER
%token <mystring> WEAPON
%token <mystring> HITS
%token <mystring> TREASURE
%token <mystring> VALUE
%token <mystring> END

%%

inputstuff: textAndNumbers
          | inputstuff textAndNumbers

textAndNumbers: ROOM        { 
                              if(int_tempRoom != -1)
                              {
                                 myMonster.monster_name = str_tempMonster;
                                 myMonster.monster_weapon = str_tempWeapon;
                                 myMonster.monster_hits = int_tempHits;
                                 tempMonster.push_back(myMonster);

                                 myTreasure.treasure_name = str_tempTreasure;
                                 myTreasure.treasure_value = int_tempValue;
                                 tempTreasure.push_back(myTreasure);

                                 myRoom.set_monster(tempMonster);
                                 myRoom.set_treasure(tempTreasure);
                                 
                                 dungeon.push_back(myRoom);

                                 tempMonster.clear();
                                 tempTreasure.clear(); 

                                 str_tempRoom = "N/A";
                                 str_tempDescription = "N/A";
                                 str_tempMonster = "N/A";
                                 str_tempWeapon = "N/A";
                                 str_tempHits = "N/A";
                                 str_tempTreasure = "N/A";
                                 str_tempValue = "N/A";

                                 int_tempRoom = 0;
                                 int_tempHits = 0;
                                 int_tempValue = 0;
                                 
                              }

                              str_tempRoom = $1; 
                              temp_pos = str_tempRoom.find(str_colon);
			      str_tempRoom.erase(0, temp_pos+2);
                              int_tempRoom = atoi(str_tempRoom.c_str());
                              myRoom.set_number(int_tempRoom);
                              free($1); }
              
              | DESCRIPTION { str_tempDescription = $1; 
                              temp_pos = str_tempDescription.find(str_colon);
                              str_tempDescription.erase(0, temp_pos+2);
                              myRoom.set_description(str_tempDescription);
                              free($1); }

              | MONSTER     { if(str_tempMonster != "N/A"){
                              myMonster.monster_name = str_tempMonster;
                              myMonster.monster_weapon = str_tempWeapon;
                              myMonster.monster_hits = int_tempHits;
                              tempMonster.push_back(myMonster);}

                              str_tempMonster = $1;
                              temp_pos = str_tempMonster.find(str_colon);
                              str_tempMonster.erase(0, temp_pos+2);
                              free($1); }

              | WEAPON      { str_tempWeapon = $1;
                              temp_pos = str_tempWeapon.find(str_colon);
                              str_tempWeapon.erase(0, temp_pos+2); 
                              free($1); }

              | HITS        { str_tempHits = $1; 
                              temp_pos = str_tempHits.find(str_colon);
                              str_tempHits.erase(0, temp_pos+2);
                              int_tempHits = atoi(str_tempHits.c_str());
                              free($1); }

              | TREASURE    { if(str_tempTreasure != "N/A"){
                              myTreasure.treasure_name = str_tempTreasure;
                              myTreasure.treasure_value = int_tempValue;
                              tempTreasure.push_back(myTreasure);}

                              str_tempTreasure = $1;
                              temp_pos = str_tempTreasure.find(str_colon);
                              str_tempTreasure.erase(0, temp_pos+2); 
                              free($1); }

              | VALUE       { str_tempValue = $1;
                              temp_pos = str_tempValue.find(str_colon);
                              str_tempValue.erase(0, temp_pos+2);
                              int_tempValue = atoi(str_tempValue.c_str()); 
                              free($1); }

              | END         { myMonster.monster_name = str_tempMonster;
                              myMonster.monster_weapon = str_tempWeapon;
                              myMonster.monster_hits = int_tempHits;
                              tempMonster.push_back(myMonster);

                              myTreasure.treasure_name = str_tempTreasure;
                              myTreasure.treasure_value = int_tempValue;
                              tempTreasure.push_back(myTreasure);

                              myRoom.set_monster(tempMonster);
                              myRoom.set_treasure(tempTreasure);

                              dungeon.push_back(myRoom); 
                              myDungeon.add_dungeon(dungeon);}


%%

main()
{
  // yyin will open a file us and be the input for yyparse. 
  extern FILE *yyin;
  yyin = fopen("dungeon.txt", "r");

  int choice = 0;

  // User menu
  while(choice != 2)
  {
     std::cout << "\n1) Parse\n"
               << "2) Exit\n";

     std::cout << "Choice: ";
     std::cin >> choice;

     if(choice == 1)
     {
        // Parse file and store contents. 
        yyparse();

        // Display contents. 
        myDungeon.display();
     }

     // Break and exit
     if(choice == 2)
        break;
  }

}

int yyerror(const char* s)
{
  fprintf(stderr, "error: %s\n", s);
}

