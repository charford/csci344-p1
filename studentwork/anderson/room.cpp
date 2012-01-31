#include "room.h" 

#include <iostream>
#include <vector>
#include <algorithm>


void Monster::MonsterDisplay() 
{
	std::cout << "     Monster    : " << m_desc << '\n' 
				<< "        Weapon  : " << weapon << '\n'
				<< "        Hits    : " << hits << '\n';
}


void Treasure::TreasureDisplay() 
{	
	std::cout << "     Treasure   : " << t_desc << '\n' 
				<< "        Value   : " << value << '\n' ;
}

void Room::Display() 
{
	std::cout << "\nRoom #:  " << room_num << "\nDesc  :  " << desc << '\n'; 
	if (monst.size() > 0)
	{
		std::cout << "   **Monsters in the Room\n"; 
		for (int i = 0; i < monst.size(); ++i) 
			monst[i].MonsterDisplay();
		std::cout << std::endl;
	}

	if (treas.size() > 0)
	{
		std::cout << "   **Treasure in the Room\n"; 
		for (int i = 0; i < treas.size(); ++i) 
			treas[i].TreasureDisplay();
	}
}

void Dungeon::DungeonDisplay() 
{	
	sort (list.begin(), list.end()); 
	std::cout << "\n\nDungeon \n"; 
	for (int i = 0; i <list.size(); ++i) 
		list[i].Display();
	std::cout << "\n\n" << std::endl;

}
