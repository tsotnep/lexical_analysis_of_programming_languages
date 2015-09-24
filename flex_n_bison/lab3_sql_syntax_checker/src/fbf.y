%{
#include <stdio.h>
#include <math.h>
void yyerror(const char *);
extern int yylex(void); 
extern int yylineno;
extern FILE *yyin;
%}


%error-verbose /* gives more descriptive errors */
%token SELECT DISTINCT FROM AS CONC INT NAME QUOTED SQUOTED WHERE BETWEEN AND IN LIKE IS NOT OR NULLx
%left '+' '-'
%left '*' '/'
%%

prog	:	
	| prog line
;

line	: ';'
	| SELECT col FROM NAME ';'		{printf("OK - select\n");}
	| SELECT DISTINCT col FROM NAME ';' 	{printf("OK - dist\n");}
	| SELECT col FROM NAME WHERE cond ';'
	| error ';'				{yyerrok;}
;

cond 	: exp
	| exp OR exp			{printf("OK - or\n");}
	| exp AND exp			{printf("OK - and\n");}
	| col NOT IN col		{printf("OK - not in \n");}
	| col NOT BETWEEN INT AND INT	{printf("OK - not between\n");}
	| col NOT LIKE SQUOTED		{printf("OK - like\n");}
	| col IS NOT NULLx		{printf("OK - null\n");}
	| col BETWEEN INT AND INT 	{printf("OK - between\n");}
	| col IN col 			{printf("OK - in\n");}
	| col LIKE SQUOTED 		{printf("OK - like\n");}
	| col IS NULLx 			{printf("OK - null\n");}
;

exp	:
	| col '=' col
	| col '>'col
	| col '<'col
	| col '>''='col
	| col '<''='col
	| col '<''>'col
;

col	: '*'
	| NAME
	| INT
	| col ',' col 
	| col '*' col
	| col '+' col
	| col '-' col
	| col '/' col
	| QUOTED
	| SQUOTED
	| col CONC col
	| col col
	| col AS col
	| '(' col ')'

;

%%

void yyerror (const char *s){
	printf ("error %s\n", s);
}

int main (int argc, char **argv){
	if (argc <2)
		return -1;
	yyin = fopen(argv[1], "r");
	if(yyin)
		yyparse();

	if (argv[2] > 0) {	
	yyin = fopen(argv[2], "r");
	if(yyin)
		yyparse();
	}

	return 0;	
}
