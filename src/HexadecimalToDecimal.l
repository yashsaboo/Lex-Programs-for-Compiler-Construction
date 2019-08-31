/* Convert Hexadecimal to Decimal numbers. */

%{
        #include <stdio.h>
        #include <string.h>
        #include <math.h>
        int decimal = 0, i = 0, val, temp;
        char *hex;
%}  

hex     [A-Fa-f0-9]
%%
{hex}+  {
                hex = yytext;
                for (i = 0; i < strlen(hex); i++)
                {
                        switch(hex[i])
                        {
                            case 'A':
                            case 'a': val = 10; break;
                            case 'B':
                            case 'b': val = 11; break;
                            case 'C':
                            case 'c': val = 12; break;
                            case 'D':
                            case 'd': val = 13; break;
                            case 'E':
                            case 'e': val = 14; break;
                            case 'F':
                            case 'f': val = 15; break;
                            case '1': val = 1; break;
                            case '2': val = 2; break;
                            case '3': val = 3; break;
                            case '4': val = 4; break;
                            case '5': val = 5; break;
                            case '6': val = 6; break;
                            case '7': val = 7; break;
                            case '8': val = 8; break;
                            case '9': val = 9; break;
                            case '0': val = 0; break;
                        }
                decimal = decimal + (val * (double)pow(16, strlen(hex) - i - 1));
            }
            printf("%d", decimal);
            decimal = 0;
        }
%%

int main(int argc, char **argv)
{
        yylex();
        return 0;
}

/*
Output:
        This is the test file for hexadecimal to decimal conversion
        1a 37 2B AA Fc

        This is tl4st l5ill4 l5or hl4x44524im101 to 3564im101 l2onvl4rsion
        24 55 43 170 252
*/