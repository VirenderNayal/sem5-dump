%{
    #include <stdio.h>
    int flag=0;
%}

%token DO EQU SEP ID NUM END NEW STAT WS;

%%

S: DO WS ID EQU E1 SEP E1 SEP E1 WS END WS DO {printf("Accepted!"); flag=1;}
E1: ID | NUM ;

%%

int main() {
    yyparse();
    return 1;
}
yyerror(const char *msg) {
    if(flag==0) {
        printf("Not Accepted\n");
    }
}
