%{
    int commentPresent = 0;
%}

%%

#.* {printf("\n %s is a Preprocessor Directive",yytext);}
if|else|while|do|break|continue|int|double|float|return|char|case|long|short|typedef|switch|unsigned|void|static|struct|goto|for { printf("\n Keyword: %s ",yytext);}
"/*" {commentPresent = 1;}
"*/" {commentPresent = 0;}
[a-zA-Z][a-zA-Z0-9]*(\[[0-9]*\])? {if(!commentPresent) printf("\n Identifier: %s",yytext);}
"+"|"-"|"*"|"/" {printf("\n Arithmetic Operator: %s ",yytext);}
","|";"|"("|")"|"["|"]" { printf("\n Delimiter:%s",yytext);}
"=" {printf("\n Assignment Operator");}
"{" {if(!commentPresent) printf("\n Block Begins");}
"}" {if(!commentPresent) printf("\n Block Ends");}
\".*\" {if(!commentPresent) printf("\n %s is a String",yytext);}
[0-9]+ {if(!commentPresent) printf("\n %s is a Number",yytext);}
"<=" | ">="| "<" | "==" {if(!commentPresent) printf("\n %s is a Relational Operator",yytext);}

%%

int main(int argc, char **argv)
{
    if(argc>1)
    {
        FILE *file;
        file=fopen(argv[1],"r");
        if(!file)
        {
            printf("\n Could not open the file: %s",argv[1]);
            exit(0);
        }
        yyin=file;
    }
    yylex();
    printf("\n\n");
    return 0;
}

int yywrap()
{
    return 0;
}