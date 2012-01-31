%{
#include "Room.h"
#include "Monster.h"
#include "Treasure.h"
#include "scratch.tab.h"
%}

%%

Value:[ ][0-9]+		{ yylval.myinteger=atoi(yytext + 7); return VALUE; }
Hits:[ ][0-9]+		{ yylval.myinteger=atoi(yytext + 6); return HITS; }
Room:[ ][0-9]+		{ yylval.myinteger=atoi(yytext + 6); return ROOM; }
Monster:[A-z0-9,' \.\-]+		{ yylval.mystring=strdup(yytext + 8); return MONSTER; }
Weapon:[A-z0-9,' \.\-]+		{ yylval.mystring=strdup(yytext + 7); return WEAPON; }
Treasure:[A-z0-9,' \.\-]+		{ yylval.mystring=strdup(yytext + 9); return TREASURE; }
Description:[A-z0-9,' \.\-]+	{ yylval.mystring=strdup(yytext + 12); return DESCRIPTION; }
%%
