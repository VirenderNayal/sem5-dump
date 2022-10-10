/*Virender 06 Sept 2022*/

%{
    #include<stdio.h>
    #include<ctype.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS

%%
lines : lines expr '\n' { printf("%g\n", $2); }
      | lines '\n'
      | /* e*/
      ;
expr    : expr '+' expr { $$ = $1 + $3; }
     | expr '-' expr { $$ = $1 - $3; }
     | expr '*' expr { $$ = $1 * $3; }
     | expr '/' expr { $$ = $1 / $3; }
     | '(' expr ')' { $$ = $2; }  
     | '-' expr %prec UMINUS { $$ = - $2; }
     | NUMBER 
     ;
%%

yyerror() {printf("Hi");}

yylex(){
    int c;
    while((c = getchar()) == ' ');
    if((c == '.') || (isdigit(c))){
        ungetc(c, stdin);
        scanf("%lf", &yylval);
        printf("%d, %d, %d", yylval, c, NUMBER);
        return NUMBER;
    }
    return c;
}

int main()
{
    printf("\n%d",yylex());
    return 0;
}

