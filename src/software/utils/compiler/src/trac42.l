/* FILE:       trac42.l
   CONTENTS:   trac42.l - This is the lexical analysator for the
               trac42 language
   REVISION:   1.0, 960917, Christer Eriksson & Jukka Mäki-Turja
               1.1, 000824, Christer Sandberg Changes:bool-const now defines value of intVal
               1.2, 001206, Christer Sandberg Changes:bool-const rule must set lineNr in yyInt not int yylval
               1.3, 040105, Björn Thor Changes:
                                       - Comments now also counts line numbers
                                       - Automatic generation of wrapper function
               1.4, 041216, Christer Sandberg Changes: \c removed from the delim definition.
               1.5, 041229, Christer Sandberg Changes: Fixed warning for unused function.
               1.6, 070105, Christer Sandberg Changes: Fixed duplicate declarations of yylineno.
               1.7, 110327, Linus Källberg fixed the operator precedence of ==, <, and <= (== should
                            have lower precedence than < and <=). Added new token types for this.
   DESCRIPTION:Compiler skeleton used in a compiler theory course. To be translated by Flex
               and compiled to a scanner. Contains the basics for scanning of the trac42 language.
               To be plugged into trac42.y as the scanner.
*/
%option noyywrap
%option nounput
%option never-interactive
%option nounistd

%x comment
%{
#include <stdio.h>     /* Standard I/O                */
#include <string.h>    /* Standard string-routines    */
//#include <io.h>
#include "ast.h"       /* Declaration of AST-nodes    */
#include "utils.h"
#include "trac42.h"    /* Declaration of yylval types */
#include "trac42.y.h"  /* Declaration of tokens       */

/*int yylineno=1;*/ /* Uncomment this if your flex version complains ... */

%}

STR     "\""([^\"])*"\""
delim   [ \t]
WS      {delim}+
DIGIT   [0-9]
LETTER  [A-Za-z]
ID      {LETTER}({LETTER}|{DIGIT})*
%%
"/*"         BEGIN(comment);
<comment>[^*\n]*
<comment>"*"+[^*/\n]*
<comment>\n            { ++yylineno; }
<comment>"*"+"/"       { BEGIN(INITIAL);}
{WS}      ;

integer       {yylval.yyType.lineNr = yylineno;
               yylval.yyType.type = INT;
               return (BASIC_TYPE);}
boolean       {yylval.yyType.lineNr = yylineno;
               yylval.yyType.type = BOOL;
               return (BASIC_TYPE);}
void          {yylval.yyType.lineNr = yylineno;
               yylval.yyType.type = VOID;
               return (BASIC_TYPE);}
float         {yylval.yyType.lineNr = yylineno;
               yylval.yyType.type = FLOAT;
               return (BASIC_TYPE);}
vector        {yylval.yyType.lineNr = yylineno;
               yylval.yyType.type = VECTOR;
               return (BASIC_TYPE);}
matrix        {yylval.yyType.lineNr = yylineno;
               yylval.yyType.type = MATRIX;
               return (BASIC_TYPE);}
pointer       {yylval.yyType.lineNr = yylineno;
               yylval.yyType.type = POINTER;
               return (BASIC_TYPE);}



if            {yylval.yyLineNr = yylineno; return (IF);}
else          {yylval.yyLineNr = yylineno; return (ELSE);}
while         {yylval.yyLineNr = yylineno; return (WHILE);}
return        {yylval.yyLineNr = yylineno; return (RETURN);}
end           {yylval.yyLineNr = yylineno; return (END);}
exit          {yylval.yyLineNr = yylineno; return (EXIT);}
then          {yylval.yyLineNr = yylineno; return (THEN);}
loop          {yylval.yyLineNr = yylineno; return (LOOP);}
procedure     {yylval.yyLineNr = yylineno; return (PROCEDURE);}
function      {yylval.yyLineNr = yylineno; return (FUNCTION);}
is            {yylval.yyLineNr = yylineno; return (IS);}
begin         {yylval.yyLineNr = yylineno; return (BGN);}
asm	      {yylval.yyLineNr = yylineno; return (ASM);}
access	      {yylval.yyLineNr = yylineno; return (ADDR_TYPE);}
":="          {yylval.yyLineNr = yylineno; return (ASSIGN);}


"\n"          {yylineno++;}
not           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = NOT;
               return (NOTOP);}
or            {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = OR;
               return (OROP);}
and           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = AND;
               return (ANDOP);}


"="           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = EQ;
               return (EQOP);}
"<="          {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = LE;
               return (LELTOP);}
"<"           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = LT;
               return (LELTOP);}
">="          {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = ME;
               return (MEMTOP);}
">"           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = MT;
               return (MEMTOP);}
"/="          {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = NE;
               return (EQOP);}


"+"           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = PLUS;
               return (PLUSOP);}
"-"           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = MINUS;
               return (MINUSOP);}
"*"           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = MULT;
               return (MULDIVOP);}
"/"           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = DIV;
               return (MULDIVOP);}

cross         {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = CROSS;
               return (VECOP);}
dot           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = DOT;
               return (VECOP);}


true          {yylval.yyString.strVal = dstrcpy(yytext); yylval.yyString.lineNr = yylineno;
               return (BOOL_CONST);}
false         {yylval.yyString.strVal = dstrcpy(yytext); yylval.yyString.lineNr = yylineno;
               return (BOOL_CONST);}

{STR}         {yytext[yyleng-1] = 0;
               yylval.yyString.strVal = dstrcpy(yytext+1);
               if (strlen(yylval.yyString.strVal) >= STRING_SIZE) {
                  yylval.yyString.strVal[STRING_SIZE] = 0;
               }
               yylval.yyString.lineNr = yylineno;
               return (STRING_CONST);}

{DIGIT}+      {yylval.yyInt.intVal = atoi(yytext);
               yylval.yyInt.lineNr = yylineno;
               return (INT_CONST);}

{DIGIT}+.{DIGIT}+     {yylval.yyFloat.floatVal = atof(yytext);
               	       yylval.yyFloat.lineNr = yylineno;
                       return (FLOAT_CONST);}


{ID}          {yylval.yyString.strVal = dstrcpy(yytext);
               yylval.yyString.lineNr = yylineno;
               return (ID);}

.             {return (yytext[0]); }  /* . matches all other characters */

%%

