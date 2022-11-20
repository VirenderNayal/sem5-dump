%{
    #include "y.tab.c"
    extern int yylval;
%}

%%

do { return (DO); }
= { return (EQU); }
, { return (SEP); }
end { return (END); }
" " { return (WS); }
\n { return (NEW); }
[a-zA-Z]+ { yylval=yytext[0];return(ID); }
[0-9]+ { yylval=atoi(yytext);return(NUM); }
[\s\S]* {return (STAT);}

%%

int yywrap() {
    return 1;
}
