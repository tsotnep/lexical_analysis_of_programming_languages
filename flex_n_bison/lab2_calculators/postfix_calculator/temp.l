/* how to compile this file? first, install "flex" in ubuntu, then, write following line in terminal */ 
/* flex scanner.l && gcc lex.yy.c -o scanner && ./scanner file_to_scan.html */

%option noyywrap 
/* same as Method called "yywrap" commented below */
/* Method for file opening and clothing */
/* int yywrap(void){ */
/*	return 1; */
/* to close the file(and afterwards, to open another file or not), you should put 1 */
/* }	*/

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

{INT}		{yylval = atoi(yytext); return INT;}
[+\-*/\n]	{return yytext[0];} /* "-" is a special symbol so we should use "\-" */
.		{;}
%%


