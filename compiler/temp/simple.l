%{
    #include<stdio.h>
%}

%%

hi { printf("bye"); }
.* { printf("wrong input"); } 

%% 

int main(){
    printf("Enter Input : ");
    yylex();
}

int yywrap(){
    return 1;
}
