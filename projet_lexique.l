%{
#include <stdio.h>
#include <stdlib.h> // atoi function
#include "projet_synthax.tab.h" // Token constants defined in projet_synthax.y via #define
%}

%%

[0-9]+      { yylval = atoi(yytext); return Number; }
"+"         { return Plus; }
"-"         { return Minus; }
"\n"        { return Equal; }
"*"         { return Mult; }
"/"         { return Div; }
"^"         { return Power; }
"("         { return PL; }
")"         { return PR; }
[ \t]+      { /* Ignore whitespace */ }
.           { printf("Unexpected input %c\n", yytext[0]); }
%%

int yywrap(){
	return 1;
}
