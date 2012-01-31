#ifndef ROOM_H
#define ROOM_H

#include <iostream>
#include <string>
#include <vector>

// Monster container
struct Monster
{
    std::string monster_name;
    std::string monster_weapon;
    int monster_hits;
};

// Treasure container
struct Treasure
{
    std::string treasure_name;
    int treasure_value;
};

// Room class
class Room
{
public:
    // Default constructor
    Room(){}

    // Custom constructor
    Room( int num, std::string desc, std::vector<Monster> monst, 
          std::vector<Treasure> treas )
    {
        number = num;
        description = desc;
        monster = monst;
        treasure = treas;
    }

    // Set variables
    void set_number(int num){number = num;}
    void set_description(std::string desc){description = desc;}
    void set_monster(std::vector<Monster> monst){monster = monst;}
    void set_treasure(std::vector<Treasure> treas){treasure = treas;}

    // Return room number.
    int get_number(){return number;}

    // Display the room.
    void display()
    {
        std::cout << "Room number: " << number << "\n\n";
        std::cout << "XXXXXXXtion: " << description << "\n";

        // Display all the monster objects.
	for(int i = 0; i < monster.size(); ++i)
        {
            std::cout << "\nMonster: " << monster[i].monster_name << "\n"
                      << "   Weapon: " << monster[i].monster_weapon << "\n"
                      << "   Hits: " << monster[i].monster_hits << "\n";
        }

        // Display all the treasure objects.
        for(int j = 0; j < treasure.size(); ++j)
        {
            std::cout << "\nTreasure: " << treasure[j].treasure_name << "\n"
                      << "   Value: " << treasure[j].treasure_value << "\n";
        }

        std::cout << "\n\n";
    }

private:
    int number;
    std::string description;
    std::vector<Monster> monster;
    std::vector<Treasure> treasure;
};

class Dungeon
{
public:
    // Default constructor
    Dungeon(){}

    // Custom constructor. 
    Dungeon(std::vector<Room> new_dungeon)
    {
        game_dungeon = new_dungeon;
    }

    // Add a dungeon. 
    void add_dungeon(std::vector<Room> new_dungeon)
    {
        game_dungeon = new_dungeon;
    }

    // Display the dungeon. 
    void display()
    {
       // Sort dungeon prior to displaying it. 
       sort(game_dungeon);

       // Display dungeon contents. 
        for(int i = 0; i < game_dungeon.size(); ++i)
           game_dungeon[i].display();
    }

    // Bubble sort the dungeon. 
    void sort(std::vector<Room>& new_dungeon)
    {
      int i, j;
      for(i = new_dungeon.size()-1; i > 0; --i)
      {
          for(j = 0; j < i; ++j)
          {
              if(new_dungeon[j].get_number() > new_dungeon[j+1].get_number())
              {
                  int temp = new_dungeon[j].get_number();
                  new_dungeon[j].set_number(new_dungeon[j+1].get_number());
                  new_dungeon[j+1].set_number(temp);
              }
          }
      }
    }

private:
    std::vector<Room> game_dungeon;
};

#endif

