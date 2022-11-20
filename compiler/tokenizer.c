#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

bool delimiter(char *s)
{
    if (!strcmp(s, " ") || !strcmp(s, "+") || !strcmp(s, "-") || !strcmp(s, "*") || !strcmp(s, "/") || !strcmp(s, ",") || !strcmp(s, ";") || !strcmp(s, ">") || !strcmp(s, "<") || !strcmp(s, "=") || !strcmp(s, "(") || !strcmp(s, ")") ||
        !strcmp(s, "[") || !strcmp(s, "]") || !strcmp(s, "{") || !strcmp(s, "}"))
    {
        return true;
    }
    return false;
}
bool keyword(char *s)
{
    if (!strcmp(s, "if") || !strcmp(s, "else") || !strcmp(s, "while") || !strcmp(s, "do") || !strcmp(s, "break") || !strcmp(s, "continue") || !strcmp(s, "int") || !strcmp(s, "double") || !strcmp(s, "float") ||
        !strcmp(s, "return") || !strcmp(s, "char") || !strcmp(s, "case") || !strcmp(s, "char") || !strcmp(s, "sizeof") || !strcmp(s, "long") || !strcmp(s, "short") || !strcmp(s, "typedef") || !strcmp(s, "switch") ||
        !strcmp(s, "unsigned") || !strcmp(s, "void") || !strcmp(s, "static") || !strcmp(s, "struct") || !strcmp(s, "goto"))
    {
        return true;
    }
    return false;
}
bool isOperator(char *ch)
{
    if (ch[0] == '+' || ch[0] == '-' || ch[0] == '*' || ch[0] == '/' || ch[0] == '>' || ch[0] == '<' || ch[0] == '=')
    {
        return true;
    }
    return false;
}
bool identifier(char *s)
{
    if (s[0] == '0' || s[0] == '1' || s[0] == '2' || s[0] == '3' || s[0] == '4' || s[0] == '5' || s[0] == '6' || s[0] == '7' || s[0] == '8' || s[0] == '9')
    {
        return false;
    }
    return true;
}
bool integer(char *s)
{
    int i, len = strlen(s);
    if (len == 0)
        return false;
    for (i = 0; i < len; i++)
    {
        if (s[i] != '0' && s[i] != '1' && s[i] != '2' && s[i] != '3' && s[i] != '4' && s[i] != '5' && s[i] != '6' &&
                s[i] != '7' && s[i] != '8' && s[i] != '9' ||
            (s[i] == '-' && i > 0))
        {
            return false;
        }
    }
    return true;
}
int main()
{
    printf("Enter the file name : ");
    char filename[30];
    scanf("%[^\n]%*c", filename);
    FILE *myfile = fopen("input.txt", "r");
    if (NULL == myfile)
    {
        printf("File can't be opened \n");
    }
    char codeline[50];
    int line_number = 1;
    while (fgets(codeline, 50, myfile) != NULL)
    {
        printf("Line : %d\n", line_number);
        char *s;
        char *rest = codeline;
        while ((s = strtok_r(rest, " ", &rest)))
        {
            if (s == "")
            {
                continue;
            }
            printf("\t");
            if (delimiter(s))
                printf("%s is a Delimiter", s);
            else if (keyword(s))
                printf("%s is a Keyword", s);
            else if (isOperator(s))
                printf("%s is a Operator", s);
            else if (identifier(s))
                printf("%s is a Identifier", s);
            else if (integer(s))
                printf("%s is a Integer", s);
            printf("\n");
        }
        line_number++;
    }
    fclose(myfile);
    printf("\n");
    return 0;
}