this program is sort of calculator
it does this:
input: 12 13 + 2 *
what happens: (12+13)*2 = 50 
output: = 50


how to make it work, type in command line, on ubuntu (you should have installed these two before : "flex", "bison")
1) flex temp.l
2) bison temp.y
3) gcc lex.yy.c temp.tab.c -o temp -Wall
4) ./temp 
5) <type a formula, for example: "48 24 / " 
