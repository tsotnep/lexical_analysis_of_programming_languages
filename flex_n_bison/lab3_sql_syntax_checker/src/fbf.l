%option case-insensitive
%option noyywrap 
%option yylineno

%top{
#include <stdio.h>
#include <stdlib.h>
#include "fbf.tab.h"
}
/* tokens: SELECT DISTINCT FROM AS */

/* Definitions */
INT		[0-9]+
CHAR 		[a-zA-Z]+
/* States */
%x QUOTE
%x SQUOTE
%x COMMENT
/* Rules */

%%
"\"" 		{BEGIN(QUOTE);}
<QUOTE>[^\"]+	{return QUOTED;} 
<QUOTE>"\"" 	{BEGIN(INITIAL);}

"\'" 		{BEGIN(SQUOTE);}
<SQUOTE>[^\']+	{return SQUOTED;} 
<SQUOTE>"\'" 	{BEGIN(INITIAL);}

"\-\-" 		{BEGIN(COMMENT);}
<COMMENT>.+	{;} 
<COMMENT>"\n" 	{BEGIN(INITIAL);}


"BETWEEN"	{return BETWEEN;}
"AND"		{return AND;}
"OR"		{return OR;}
"NOT"		{return NOT;}
"LIKE"		{return LIKE;}
"IS"		{return IS;}
"IN"		{return IN;}
"NULL"		{return NULLx;}



"SELECT"	{return SELECT;}
"WHERE"		{return WHERE;}
"DISTINCT"	{return DISTINCT;}
"FROM"		{return FROM;}
"AS"		{return AS;}
"||"		{return CONC;}
{INT}		{return INT;}
[+\-*=<>();,]	{return yytext[0];}
{CHAR}		{return NAME;}
"\n"		{;}
.		{;}

%%


