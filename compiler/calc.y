%{
    #include <stdio.h>
    int flag=0;
    int yylex();
    int yyerror();
%}

%token NUM
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%

S: E{printf("Result = %d\n", $$); flag=0; return 0;};
E: E '+' E {$$=$1+$3;}
|E '-' E {$$=$1-$3;}
|E '*' E {$$=$1*$3;}
|E '/' E {$$=$1/$3;}
|'(' E ')' {$$=$2;}
|NUM {$$=$1;}

%%

int main() {
    yyparse();
    if(flag==0)
    printf("Valid Expression \n");
    return 1;
}

yyerror(const char *msg) {
    printf(msg);
    printf("Invalid Expression \n");
    flag=1;
}