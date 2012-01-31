%{
#include "room.h"
#include "test.tab.h"
#include <string>
#include <cstring>
using namespace std;
%}

%%
[ \t]*Room:.*$			{	std::string str = std::string(yytext);
								int ndx = str.find_first_of(':');
								str = str.substr( ndx+1, str.size() );
								ndx += str.find_first_not_of(' ');
								yylval.myinteger=atoi(yytext +ndx+1); 
								return RNUM;}

[ \t]*Description:.*$ {	std::string str = std::string(yytext);
								int ndx = str.find_first_of(':');
								str = str.substr( ndx+1, str.size() );
								ndx += str.find_first_not_of(' ');
								yylval.mystring=strdup(yytext + ndx + 1); 
								return RDESC;}

[ \t]*Monster:.*$		{	std::string str = std::string(yytext);
								int ndx = str.find_first_of(':');
								str = str.substr( ndx+1, str.size() );
								ndx += str.find_first_not_of(' ');
								yylval.mystring=strdup(yytext+ndx+1);
								return MONSTER;}

[ \t]*Weapon:.*$   	{  std::string str = std::string(yytext);
								int ndx = str.find_first_of(':');
								str = str.substr( ndx+1, str.size() );
								ndx += str.find_first_not_of(' ');
								yylval.mystring=strdup(yytext + ndx + 1);
								return WEP;}

[ \t]*Hits:.*$     	{	std::string str = std::string(yytext);
								int ndx = str.find_first_of(':');
								str = str.substr( ndx+1, str.size() );
								ndx += str.find_first_not_of(' ');
								yylval.myinteger=atoi(yytext +ndx+1); 
								return HITS;}

[ \t]*Treasure:.*$ 	{	std::string str = std::string(yytext);
								int ndx = str.find_first_of(':');
								str = str.substr( ndx+1, str.size() );
								ndx += str.find_first_not_of(' ');
								yylval.mystring=strdup(yytext + ndx + 1); 
								return TDESC;}

[ \t]*Value:.*$    	{	std::string str = std::string(yytext);
								int ndx = str.find_first_of(':');
								str = str.substr( ndx+1, str.size() );
								ndx += str.find_first_not_of(' ');
								yylval.myinteger=atoi(yytext +ndx+1); 
								return VAL;}
%%
