Authors:
	Vaiko Vahter, 
	Nevin George,
	Tsotne Putkaradze.


how to Run:
	flex fbf.l && bison -d -rall fbf.y && gcc lex.yy.c fbf.tab.c -o fbf -Wall -lm && ./fbf oracle.sql error.sql
