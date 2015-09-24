%option case-insensitive
%option noyywrap 

%top{
#include <stdio.h>
#include <stdlib.h>
#include "temp.tab.h"
}

/* Definitions */
INT		[0-9]+

/* States */

/* Rules */
%%

"SQRT"		{return SQRT;}
{INT}		{yylval = atoi(yytext); return INT;}
[\^+\-*/\n()]	{return yytext[0];} /* "-" is a special symbol so we should use "\-" */
.		{;}
%%


