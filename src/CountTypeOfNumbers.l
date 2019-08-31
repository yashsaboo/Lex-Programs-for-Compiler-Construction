/* Count number of positive numbers, negative numbers, positive real numbers and negative real numbers. */

%{
        int positives = 0;
        int negatives = 0;
        int positiveFractions = 0;
        int negativeFractions = 0;
%}

%%

[0-9]+                  { positives++; ECHO; }
-[0-9]+                 { negatives++; ECHO; }
\+?[0-9]*\.[0-9]+       { positiveFractions++; ECHO; }
-[0-9]*\.[0-9]+         { negativeFractions++; ECHO; }
.                       ;
%%

int main(int argc, char **argv)
{
        FILE *fp = fopen(argv[1], "r");
        yyin = fp;
        yylex();
        printf("Number of Positives: %d\n", positives);
        printf("Number of Negatives: %d\n", negatives);
        printf("Number of Positive Fractions: %d\n", positiveFractions);
        printf("Number of Negative Fractions: %d\n", negativeFractions);

        return 0;
}

/*
Output:
        21
        -38
        -3.3
        2.2
        0

        No of Positives: 2
        No. of Negatives: 1
        No. of Positive Fractions: 1
        No of Negative Fractions: 1
*/