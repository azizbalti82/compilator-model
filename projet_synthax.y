%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
	void yyerror(const char*);
	#include <stdio.h>
%}

%token Plus Minus Number Equal Mult Div Power PL PR
%start input //el racine nte3 el arbre syntaxique
%left Plus Minus
%left Mult Div
%right Power

%%
input : /*nothing*/ | input line {printf("The result is %d\n",$2);}
line : Equal | Exp Equal; 
Exp :   Number 
	| Exp Plus  Exp {$$ = $1 + $3;} 
	| Exp Minus Exp {$$ = $1 - $3;}
	| Exp Mult  Exp {$$ = $1 * $3;}
	| Exp Div   Exp {if($3 == 0){printf("Can not divide by zero\n");} else $$ = $1 / $3;}
	| Exp Power Exp {int x = $1;for(int i = 1;i<$3;i++) x*=$1;$$ = x;}
	| PL Exp PR     {$$ = $2;} // Return the value within the parentheses
%%

void yyerror(const char *s){
	printf ("Error happend %s",s);
}
int main(void){
	yyparse();
}