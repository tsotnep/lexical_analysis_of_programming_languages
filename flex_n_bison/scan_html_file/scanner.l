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
}

/* Definitions */
INT		[0-9]

/* States */
%x NAME
%x TIME
%x DATE

/* Rules */
%%
"<span class=\"time\">"				{BEGIN(TIME);}	/* when we see that(left side) pattern, we go into this state: TIME */
<TIME>"<"					{BEGIN(INITIAL);} /* when we see "<" we go in initial state */
<TIME>[^<]*					{printf("%s ", yytext);} /* we print everything except "<" */

"<h2 >"{INT}{2,2}"."{INT}{2,2}"."		{BEGIN(DATE);}	/* order of rules, define "strength"(order of execution) of rules */
<DATE>"</h2>"					{BEGIN(INITIAL);} 
<DATE>[^<]*					{printf(" %s \n", yytext);}

"\">"{INT}{6,6}" - "				{BEGIN(NAME);}
<NAME>"<"					{BEGIN(INITIAL);}
<NAME>[^<]*					{printf("%s \n", yytext);}

.	; /* filter out everything elsee */
\n	; /* filter out new lines */
%%

/* main function is  */
int main(int argc, char **argv){
	if(argc < 2){
		printf("number of arguements were less than 1 \n"); /* in fact there should be 2 instead of 1, on this line */
		/* where first arguement is scanner.l and others should be files */
		return -1;
	}
	int i;
	/* if we say "... ./scanner f1.ext f2.ext" then argc=3, argv[0]=scanner.l argv[1]=f1.ext, argv[2]=f2.ext */
	for(i=1; i <argc; i++){
		yyin = fopen(argv[i], "r");
		if(yyin) /* if there is file called yyin, we perform yylex() */
			yylex();
		else
			printf("cant open %s\n", argv[i]);
	}
}
