%option case-insensitive
%option noyywrap 
%option yylineno

%top{
#include "lab4.h"
#include "lab4.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
}

/* Definitions */
INT		[0-9]+

/* States */
%x STRING
%x COMMENT

/* Rules */
%%
"IF"		{return IF;}
"ELSE"		{return ELSE;}
"ENDIF"		{return ENDIF;}

"WHILE"		{return WHILE;}
"READ"		{return READ;}
"PRINT"		{return PRINT;}


{INT}		{yylval.val = atoi(yytext); return INT;}
[A-Z][A-Z0-9]*	{yylval.s = strdup(yytext); return VAR;}
[+\-*/(){};]	{return yytext[0];} /* "-" is a special symbol so we should use "\-" */

\"		{BEGIN(STRING);}
<STRING>[^\"]+	{yylval.s = strdup(yytext); return STR;}
<STRING>\"	{BEGIN(INITIAL);}

"//"		{BEGIN(COMMENT);}
<COMMENT>.+	{;}
<COMMENT>\n	{BEGIN(INITIAL);}

.		{;}
\n		{;}
%%


