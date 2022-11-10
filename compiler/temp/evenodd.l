%{
    #include<stdio.h>
    int m = 0;
%}

%% 

[0-9]+ { m = atoi(yytext);
    
        if(m%2 == 0)
            printf("Even");
        else
            printf("Odd");
}

%%

int main(){
    printf("Enter Number : ");
    yylex();
}

int yywrap(){
    return 1;
}
