%option noyywrap
%{
#include<stdio.h>
int cnt_id , cnt_key , cint_int , cnt_float, cnt_exp;
%}

key "int"|"main"|"for"|"while"|"return"|"do"|"printf"|"if"|"else"|"else if"
digit [0-9]
letter [_A-Za-z]

%%
{key} {printf("%s is a key word \n",yytext); cnt_key++;}
{letter}({letter}|{letter})* {printf("%s is a ID :\n",yytext); cnt_id++;}
{digit}+ {printf("%s is a Number \n",yytext); cint_int++;}
{digit}+"."{digit}+ {printf("%s is a Float \n",yytext); cnt_float++;}
{digit}+("."{digit}+)?("E+"|"E-"|"E")?{digit}+ {printf("%s is a EXP Number \n",yytext); cnt_exp++;}
. {printf("Invalid Token \n");}
%%

int main()
{
    yylex();
    printf("Total Number of KeyWord :%d\n",cnt_key);
    printf("Total Number of ID :%d\n",cnt_id);
    printf("Total Number of int :%d\n",cint_int);
    printf("Total Number of float :%d\n",cnt_float);
    printf("Total Number of EXP :%d\n",cnt_exp);
    return 0;
}