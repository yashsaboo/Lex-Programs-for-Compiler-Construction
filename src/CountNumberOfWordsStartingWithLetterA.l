/* Count number of words start with ‘A’. */

%{
        int words = 0;
%}

regex   A.*

%%

{regex}                 { words++; ECHO;}
.                       { ECHO; }
%%

int main(int argc, char **argv)
{
        FILE *fp = fopen(argv[1], "r");
        yyin = fp;
        yylex();
        printf("\nNumber of words start with A: %d\n", words);
        fclose(fp);
        return 0;
}

/*
Output:
       	This is a file for lab 3
		Calculate number of words starting with A
		About arey bAr avout Alam for
		Expected Ouptut = 4

		Number of words start with A:4

*/