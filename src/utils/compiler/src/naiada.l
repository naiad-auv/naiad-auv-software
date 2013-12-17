/* FILE:       naiada.l
   CONTENTS:   naiada.l - This is the lexical analysator for the
               NaiAda language
   AUTHOR:     Per-Erik Måhl

   DESCRIPTION: Based on the lab 3 skeleton used in a compiler theory course at
		Mälardalen University. To be translated by Flex
                and compiled to a scanner. To be plugged into naiada.y as the scanner.

*/
%option noyywrap
%option nounput
%option never-interactive
%option nounistd

%x C_COMMENT
%{
#include <stdio.h>     /* Standard I/O                */
#include <string.h>    /* Standard string-routines    */
#include "ast.h"       /* Declaration of AST-nodes    */
#include "utils.h"
#include "naiada.h"    /* Declaration of yylval types */
#include "naiada.y.h"  /* Declaration of tokens       */

#define YY_NO_INPUT

/*int yylineno=1;*/ /* Uncomment this if your flex version complains ... */

%}

STR     "\""([^\"])*"\""
delim   [ \t]
WS      {delim}+
DIGIT   [0-9]
LETTER  [A-Za-z_]
VECCOMP [X-Zx-z]
ID      {LETTER}({LETTER}|{DIGIT})*
%%
"/*"            	{ BEGIN(C_COMMENT); }
<C_COMMENT>"*/" 	{ BEGIN(INITIAL); }
<C_COMMENT>.    	{ }
<C_COMMENT>\n		{ ++yylineno; }
{WS}      ;
"--".*"\n"		{ ++yylineno; }

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

sin           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = SIN;
               return (MATH_TYPE);}
cos           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = COS;
               return (MATH_TYPE);}
arcsin        {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = ASIN;
               return (MATH_TYPE);}
arccos        {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = ACOS;
               return (MATH_TYPE);}
abs           {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = ABS;
               return (MATH_TYPE);}
sqrt          {yylval.yyOperator.lineNr = yylineno;
               yylval.yyOperator.opType = SQRT;
               return (MATH_TYPE);}




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
smc	      {yylval.yyLineNr = yylineno; return (ASM);}
access	      {yylval.yyLineNr = yylineno; return (ADDR_TYPE);}
null	      {yylval.yyLineNr = yylineno; return (NULL_STMNT);}
goto	      {yylval.yyLineNr = yylineno; return (GOTO);}
in	      {yylval.yyLineNr = yylineno; return (IN);}
out	      {yylval.yyLineNr = yylineno; return (OUT);}
primitive     {yylval.yyLineNr = yylineno; return (PRIMITIVE);}
":="          {yylval.yyLineNr = yylineno; return (ASSIGN);}
"<<"	      {yylval.yyLineNr = yylineno; return (LBL_LEFT);}
">>"	      {yylval.yyLineNr = yylineno; return (LBL_RIGHT);}


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


true          {yylval.yyString.strVal = dstrcpy(yytext); yylval.yyString.lineNr = yylineno;
               return (BOOL_CONST);}
false         {yylval.yyString.strVal = dstrcpy(yytext); yylval.yyString.lineNr = yylineno;
               return (BOOL_CONST);}

{STR}         {yytext[yyleng-1] = 0;
               yylval.yyString.strVal = dstrcpy(yytext+1);
               yylval.yyString.lineNr = yylineno;
               return (STRING_CONST);}

{DIGIT}+      {yylval.yyInt.intVal = atoi(yytext);
               yylval.yyInt.lineNr = yylineno;
               return (INT_CONST);}

{DIGIT}+\.{DIGIT}+     {yylval.yyFloat.floatVal = atof(yytext);
               	       yylval.yyFloat.lineNr = yylineno;
                       return (FLOAT_CONST);}


{ID}          {yylval.yyString.strVal = dstrcpy(yytext);
               yylval.yyString.lineNr = yylineno;
               return (ID);}

{ID}\.[XYZ]Vector	{yytext[yyleng-8] = 0;
			 yylval.yyComp.strVal = dstrcpy(yytext);
	         	 yylval.yyComp.lineNr = yylineno;
			 yylval.yyComp.iComponent = (yytext[yyleng-7] == 'X' ? 1 : (yytext[yyleng-7] == 'Y' ? 2 : 3));
	                 return (MAT_COMP);}

{ID}\.[XYZ]		{yytext[yyleng-2] = 0;
			 yylval.yyComp.strVal = dstrcpy(yytext);
	         	 yylval.yyComp.lineNr = yylineno;
			 yylval.yyComp.iComponent = (yytext[yyleng-1] == 'X' ? 1 : (yytext[yyleng-1] == 'Y' ? 2 : 3));
	                 return (VEC_COMP);}

.             {return (yytext[0]); }  /* . matches all other characters */

%%

