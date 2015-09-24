this program is postfix or infix calculator

how to make it work, type in command line, on ubuntu (you should have installed these two before : "flex", "bison")
1) flex temp.l
2) bison -d -rall temp.y
3) gcc lex.yy.c temp.tab.c -o temp -Wall -lm 	/* -lm =  link mathematics for power function, -Wall= for Warning All */
/* there will be warnings but its OK */
4) ./temp 
5) <type a formula, for example: "48 24 / 6 +"- if postfix, if infix: "4+2-3*10/5 *(3-1)"
