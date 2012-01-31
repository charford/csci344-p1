%{
#include <string>
#include "Room.h"
#include "Monster.h"
#include "Treasure.h"
#include "dungeon.tab.h"
%}

%option yylineno

%%

"Room: "				return ROOM;
"Description: "                         return DESCRIPTION;                        
"Monster: "                             return MONSTER;                        
"Hits: "				return HITS;
"Weapon: "				return WEAPON;
"Treasure: "                            return TREASURE;
"Value: "				return VALUE;

"\n"                                    return EOL;
[0-9]+                                  { yylval.myint = atoi( yytext ); return NUMBER; }
[A-Za-z0-9,.'\-][A-Za-z0-9,.' \-]+      { yylval.mystring = strdup( yytext ); return STRING_DATA; }
^[ \t\n]+                               /* ignore leading whitespace */

%%
