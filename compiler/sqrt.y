%{
    #include <stdio.h>
    int flag=0;
    int yylex();
    int yyerror();
    float sq(int);
%}

%token NUM

%%

S: E{printf("Result = %d\n", $$); flag=0; return 0;};
E: NUM {$$=sq($1);}

%%

int main() {
    printf("Enter a number to find square root of : ");
    yyparse();
    if(flag==0)
    printf("Valid Expression \n");
    return 1;
}

float sq(int number){
    int start = 0, end = number;
    int mid;
 
    float ans;
 
    while (start <= end) {
 
        mid = (start + end) / 2;
 
        if (mid * mid == number) {
            ans = mid;
            break;
        }
 
        if (mid * mid < number) {
            ans=start;
            start = mid + 1;
        }
 
        else {
            end = mid - 1;
        }
    }
 
    float increment = 0.1;
    for (int i = 0; i < 5; i++) {
        while (ans * ans <= number) {
            ans += increment;
        }
 
        ans = ans - increment;
        increment = increment / 10;
    }
    return ans;    
}

yyerror(const char *msg) {
    printf(msg);
    printf("Invalid Expression \n");
    flag=1;
}
