/* Count the number of strings ending with ‘com’, ‘in’, ‘org’ or ‘gov’. */

%{
        int com = 0;
        int org = 0;
        int in = 0;
        int gov = 0;
        int lines = 0;
%}

com [com]
org [org]
in  [in]
gov [gov]
space [ \t\n]

%%

.*{com}{space}  { com++; ECHO; }
.*{org}{space}  { org++; ECHO; }
.*{in}{space}   { in++; ECHO; }
.*{gov}{space}  { gov++; ECHO; }
\n              { lines++; ECHO; }

%%

int main(int argc, char **argv)
{
        yylex();
        printf("\nNumber of lines ending with 'com': %d", com);
        printf("\nNumber of lines ending with 'org': %d", org);
        printf("\nNumber of lines ending with 'in': %d", in);
        printf("\nNumber of lines ending with 'gov': %d\n", gov);
        printf("\nNumber of lines not ending with 'com, org, in, gov': %d\n", lines);
        return 0;
}

/*
Output:
        Valid strings
        www.google.com
        www.google.co.in
        www.uiuc.edu.in
        www.sample.org
        www.samplel.gov
        www.fb.com
        Invalid Strings
        www.google.co.us
        www.sample.jp

        No of lines ending with ‘com’: 2
        No of lines ending with ‘org’: 1
        No of lines ending with ‘in’: 2
        No of lines ending with ‘gov’: 1
        No of lines not ending with ‘com, org, in, gov’: 4

*/