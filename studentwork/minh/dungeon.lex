%{
#include "classes.h"
#include "dungeon.tab.h"
int compute_colon_position(const char* cstar)
{
 std::string stringy = cstar;
 return stringy.find_first_of(":");
}
%}

%%

[ \t]*Value:[ ].*$ { yylval.myinteger=atoi(yytext+2+compute_colon_position(yytext)); return VALUE;}
[ \t]*Value:.*$ { yylval.myinteger=atoi(yytext+1+compute_colon_position(yytext)); return VALUE;}
[ \t]*Treasure:[ ].*$ { yylval.mystring=strdup(yytext+2+compute_colon_position(yytext)); return TREASURE;}
[ \t]*Treasure:.*$ { yylval.mystring=strdup(yytext+1+compute_colon_position(yytext)); return TREASURE;}
[ \t]*Hits:[ ].*$ { yylval.myinteger=atoi(yytext+2+compute_colon_position(yytext)); return HITS;}
[ \t]*Hits:.*$ { yylval.myinteger=atoi(yytext+1+compute_colon_position(yytext)); return HITS;}
[ \t]*Weapon:[ ].*$ {yylval.mystring=strdup(yytext+2+compute_colon_position(yytext)); return WEAPON;}
[ \t]*Weapon:.*$ {yylval.mystring=strdup(yytext+1+compute_colon_position(yytext)); return WEAPON;}
[ \t]*Monster:[ ].*$ {yylval.mystring=strdup(yytext+2+compute_colon_position(yytext)); return MONSTER;}
[ \t]*Monster:.*$ {yylval.mystring=strdup(yytext+1+compute_colon_position(yytext)); return MONSTER;}
[ \t]*Room:[ ].*$ {yylval.myinteger=atoi(yytext+2+compute_colon_position(yytext)); return ROOM;}
[ \t]*Room:.*$ {yylval.myinteger=atoi(yytext+1+compute_colon_position(yytext)); return ROOM;}
[ \t]*Description:[ ].*$ {yylval.mystring=strdup(yytext+2+compute_colon_position(yytext)); return DESCRIPTION;}
[ \t]*Description:.*$ {yylval.mystring=strdup(yytext+1+compute_colon_position(yytext)); return DESCRIPTION;}
%%
