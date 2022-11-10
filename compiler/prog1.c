/*
Virender Singh Nayal
2020UCO1545
COE-1
30 August 2022 (4 PM - 6 PM)
*/

#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main()
{
    FILE *fi, *fo, *fop, *fk;
    int flag = 0, i = 1;
    char c, t, a[15], ch[15], file[20];

    printf("\n Enter the File Name : ");
    scanf("%s", &file);

    fi = fopen(file, "r");
    fo = fopen("output", "w");
    fop = fopen("operators", "r");
    fk = fopen("keywords", "r");

    c = getc(fi);
    while (!feof(fi))
    {
        if (isalpha(c) || isdigit(c) || (c == '[' || c == ']' || c == '.' == 1))
            fputc(c, fo);
        else
        {

            if (c == '\n')
                fprintf(fo, "\t\\n\t");
            else
                fprintf(fo, "\t%c\t", c);
        }
        c = getc(fi);
    }

    fclose(fi);
    fclose(fo);

    fi = fopen("output", "r");

    printf("\n Lexical Analysis");
    
    fscanf(fi, "%s", a);

    printf("\n Line: %d\n", i++);

    while (!feof(fi))
    {
        if (strcmp(a, "\\n") == 0)
        {
            printf("\n Line: %d \n", i++);
            fscanf(fi, "%s", a);
        }
        fscanf(fop, "%s", ch);
        while (!feof(fop))
        {
            if (strcmp(ch, a) == 0)
            {
                fscanf(fop, "%s", ch);
                printf("\t\t%s\t:\tOperator\n", a);
                flag = 1;
            }
            fscanf(fop, "%s", ch);
        }
        rewind(fop);
        fscanf(fk, "%s", ch);
        while (!feof(fk))
        {
            if (strcmp(ch, a) == 0)
            {
                fscanf(fk, "%k", ch);
                printf("\t\t%s\t:\tKeyword\n", a);
                flag = 1;
            }

            fscanf(fk, "%s", ch);
        }
        rewind(fk);
        if (flag == 0)
        {
            if (isdigit(a[0]))
                printf("\t\t%s\t:\tConstant\n", a);
            else
                printf("\t\t%s\t:\tIdentifier\n", a);
        }
        flag = 0;
        fscanf(fi, "%s", a);
    }
}
