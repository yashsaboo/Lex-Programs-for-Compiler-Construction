/* Find the number of comments, keywords, identifiers, spaces, words and lines in a given file. */

%{
#include<stdio.h>
int identifiers=0;
int comments=0;
int spaces=0;
int keywords=0;
int lines=0;
int words=0;
%}
%%

[ ] {spaces++;}
["//"] {comments++;}
auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while keywords++;
[a-zA-Z][a-zA-Z0-9]* {identifiers++;}
\n {lines++;words++;}
[\t''] words++;
. 
%%

int yywrap()
{
return 1;
}

int main()
{
printf("Enter the string.. at end press^d\n");
yylex();
printf("\n");
printf("No. of comments = %d\n",comments/2);
printf("No. of identifiers = %d\n",identifiers);
printf("No. of spaces = %d\n",spaces);
printf("No. of keywords = %d\n",keywords);
printf("No. of lines = %d\n",lines+1);
printf("No. of words = %d\n",words);
return 0;
}

/*
Output:
		Enter the string.. at end press^d
		if yash is a student
		enrol in a course
		break
		//nm

		No. of comments = 1
		No. of identifiers = 0
		No. of spaces = 6
		No. of keywords = 2
		No. of lines = 4
		No. of words = 3
*/