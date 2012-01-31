%{
#include "Room.h"
#include "dungeon.tab.h"

%}

%%

[ \t]*Room:.*$         { yylval.mystring=strdup(yytext); return ROOM;}
[ \t]*Description:.*$  { yylval.mystring=strdup(yytext); return DESCRIPTION;}
[ \t]*Monster:.*$      { yylval.mystring=strdup(yytext); return MONSTER;}
[ \t]*Weapon:.*$       { yylval.mystring=strdup(yytext); return WEAPON;}
[ \t]*Hits:.*$         { yylval.mystring=strdup(yytext); return HITS;}
[ \t]*Treasure:.*$     { yylval.mystring=strdup(yytext); return TREASURE;}
[ \t]*Value:.*$        { yylval.mystring=strdup(yytext); return VALUE;}
[ \t]*END.*$           { yylval.mystring=strdup(yytext); return END;}

%%

