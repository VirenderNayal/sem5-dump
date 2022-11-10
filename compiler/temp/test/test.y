%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token A B

%%

start : S { return 0; }

S : A S B | ;

%%

int main(){
    printf("Enter String : ");
    if(yyparse() == 0) // input string is accepted
        printf("String Accepted!");
}


yyerror(){
    printf("String not accepted.");
    exit(0);
}

