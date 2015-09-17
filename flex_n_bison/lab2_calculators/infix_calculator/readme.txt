this program is sort of calculator
it does this:
input: 12+ 13* 2 * (3-5) + sqrt(9) + 3^2
what happens: <calculates>
output: = <int number>


how to make it work, type in command line, on ubuntu (you should have installed these two before : "flex", "bison")
1) flex temp.l
2) bison temp.y
3) gcc lex.yy.c temp.tab.c -o temp -Wall -lm /* -lm =  link mathematics for power function, -Wall= for Warning All */
4) ./temp 
5) <type a formula, for example: "48 24 / " 
