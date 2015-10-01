%{
#include "lab4.h"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdarg.h>

void yyerror(const char *);
extern int yylex(void);
extern FILE *yyin;
extern int yylineno;
t_node *root;
int varCount;
t_varNode **variables;

t_node *block(t_node *a, t_node *b);
t_node *oper(int type, int n, ...);
t_node *intToNode(int val);
t_node *strToNode(char *s);
t_node *findVar(char *name);

%}

%union{
	int val;
	char *s;
	t_node *node;
	
}

%error-verbose
%token <val> INT
%token <s> STR VAR
%token WHILE READ PRINT IF ELSE ENDIF
%type <node> stmts stmt exp


%left '+' '-'
%left '*' '/'
%right NEG
%%

prog	: stmts			{root = $1;}
;

stmts	: stmt			{$$ = $1;}
	| stmts stmt		{$$ = block($1, $2);}
;

stmt	: VAR '=' exp ';'	{$$ = oper('=', 2, findVar($1), $3);}
	| PRINT VAR ';'		{$$ = oper(PRINT, 1, findVar($2));}
	| PRINT STR ';'		{$$ = oper(PRINT, 1, strToNode($2));}
	| READ VAR ';'		{$$ = oper(READ,1,findVar($2));}
	| WHILE exp stmt ';'	{$$ = oper(WHILE, 2, $2, $3);}
	| '{' stmts '}'		{$$ = $2;}
	| IF exp stmt ENDIF	{$$ = oper(IF,2,$2,$3);}
	| IF exp stmt ELSE stmt	ENDIF {$$ = oper(ELSE, 3, $2, $3, $5);}

exp	: INT 			{$$ = intToNode($1);} 	/* order here does not matter */
	| VAR			{$$ = findVar($1);}	// we can't create new one every time
	| exp '+' exp 		{$$ = oper('+',2, $1, $3);}
	| exp '-' exp 		{$$ = oper('-',2, $1, $3);}
	| exp '/' exp 		{$$ = oper('/',2, $1, $3);}
	| exp '*' exp 		{$$ = oper('*',2, $1, $3);}
	| '(' exp ')'		{$$ = $2;}
	| '-' exp %prec NEG	{$$ = oper(NEG, 1, $2);} /* inline defines what is the level of precedence */
;

%%

t_node *block(t_node *a, t_node *b){return NULL;}
t_node *oper(int type, int n, ...){return NULL;}
t_node *intToNode(int val){return NULL;}
t_node *strToNode(char *s){return NULL;}
t_node *findVar(char *name){return NULL;}


void yyerror (const char *s){
	printf ("error %s\n", s);
}

int main (void){
	yyparse();
}
