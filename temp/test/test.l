%{
    #include "y.tab.h"
%}

%%

a { return A; }
b { return B; }
\n { return 0; }

%%    

yywrap() { return 1; }

