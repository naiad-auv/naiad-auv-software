/* FILE:       trac42.y
   CONTENTS:   trac42.y - This is the syntax analysator for the TRAC42-language
   REVISION:   1.0, 960917, Christer Eriksson & Jukka Maki-Turja
               1.1, 000824, Christer Sandberg Changes:bool-const now of type yyInt to make
                            the value from lex available.
               1.2, 110327, Linus Källberg fixed the operator precedence of ==, <, and <= (== should
                            have lower precedence than < and <=). Added new token types for this. Also
                            fixed so that formal parameter lists can contain a single "void".
   DESCRIPTION: Compiler skeleton used in a compiler theory course. To be translated by Bison
                and compiled to a syntax checker. Contains the basics for syntax checking. To
                be extended with semantic rules for building an AST, and calls to name analysis,
                type analysis, offset calculation and code generation. Plug in trac42.l as scanner.
*/

%{
#include <stdio.h>
#include <malloc.h>
#include <stddef.h>
#include <string.h>
#include "ast.h"        /* Data structures and constructors for the AST */
#include "trac42.h"     /* Various definitions */
#include "symtab.h"
#include "emit.h"
#include "trac42.y.h"   /* Declaration of tokens, genereated by bison. */
#include "gentrac42.h"
#include "name.h"
#include "types.h"
#include "gensmc.h"

extern FILE *yyin;
int yyerror(const char *s);
int yylex(void);

%}
/* Alternative types of teh elements on the parse-value stack */
%union {
   t_tree       yyNode;
   intStruct    yyInt;
   stringStruct yyString;
   typeStruct   yyType;
   opStruct     yyOperator;
   int          yyLineNr;
};

/* Specifies operator precedence and what's on parse stack for these operators */
%left  <yyOperator> OROP
%left  <yyOperator> ANDOP
%left  <yyOperator> EQOP
%left  <yyOperator> LELTOP
%left  <yyOperator> MINUSOP PLUSOP
%left  <yyOperator> MULDIVOP
%right <yyOperator> NOTOP UNOP

/* Rule types on parse stack */
%type  <yyNode>   program functions function formals_non_emtpty formals formal
%type  <yyNode>   decls decl stmnts stmnt expr actuals exprs idents ident

/* Specifies the types of other tokens than the operators, when on the parse stack */
%token <yyType>   BASIC_TYPE
%token <yyString> ID STRING_CONST
%token <yyInt>    INT_CONST BOOL_CONST
%token <yyLineNr> IF ELSE WHILE RETURN READ WRITE

%expect 1

%start program

%%

program     : functions 									{ treeRoot = mProgram($1); }
            ;

functions   : functions function								{ $$ = connectFunctions($1,$2); }
            | function										{ $$ = $1; }
            ;

function    : BASIC_TYPE ID '(' formals ')' '{' decls stmnts '}' 				{ $$ = mFunction(connectVariables($4, $7),$8,$2.strVal,$1.type,$2.lineNr); }
            ; 'procedure' 

formals     : formals_non_emtpty								{ $$ = $1; }
            | BASIC_TYPE 									{if ($1.type != VOID)	{ yyerror("invalid formal parameter list"); YYERROR; } $$ = NULL;}
            | {$$ = NULL;}
            ;

formals_non_emtpty : formals_non_emtpty ',' formal						{ $$ = connectVariables($1,$3); }
            | formal										{ $$ = $1; }
            ;

formal      : BASIC_TYPE ID 									{ $$ = mVariable(kFormal, $2.strVal, $1.type, $2.lineNr); }
            ;

decls       : decls decl									{ if ($1 != NULL) { $$ = connectVariables($1, $2); } else { $$ = $2; } }
            |											{ $$ = NULL; }
            ;

/*
decl        : BASIC_TYPE { $<yyType> = BASIC_TYPE; } idents ';'   { $$ = $2; }
            ;
*/

decl        : BASIC_TYPE idents ';'   								{ $$ = addType($2, $1.type); }
            ;


/* idents      : idents { $<yyType> = $<yyType>0; } ',' ident	{ $3->Node.Variable.Type = $<yyType>0; $$ = connectVariables($1,$3); } */
/* idents      : idents ',' ident	{ $3->Node.Variable.Type = $<yyType>0; $$ = connectVariables($1,$3); } */
/*            | ident				{ $1->Node.Variable.Type = $<yyType>0; $$ = $1; } */
idents      : idents ',' ident									{ $$ = connectVariables($1,$3); }
            | ident										{ $$ = $1; }
            ;

ident       : ID                      								{ $$ = mVariable(kLocal, $1.strVal,VOID,$1.lineNr); }
            ;

stmnts      : stmnts stmnt									{ $$ = connectStmnts($1,$2); }
            | stmnt										{ $$ = $1; }
            ;

stmnt       : ID '=' expr ';'                       						{ $$ = mAssign($1.strVal, $3, $1.lineNr); }
            | IF '(' expr ')' stmnt ELSE stmnt      						{ $$ = mIf($3, $5, $7, $1); }
            | IF '(' expr ')' stmnt                 						{ $$ = mIf($3, $5, NULL, $1); }
            | WHILE '(' expr ')' stmnt              						{ $$ = mWhile($3, $5, $1); }
            | RETURN expr ';'                       						{ $$ = mReturn($2, $1); }
            | READ ID ';'                           						{ $$ = mRead($2.strVal, $1); }
            | WRITE expr ';'                        						{ $$ = mWrite($2, $1); }
            | '{' stmnts '}'                        						{ $$ = $2; }
            | ID '(' actuals ')' ';'                						{ $$ = mFuncCallStmnt($3, $1.strVal, $1.lineNr); }
            ;

expr        : MINUSOP expr %prec UNOP								{ $$ = mUnary($1.opType, $2, $1.lineNr); }
            | NOTOP expr									{ $$ = mUnary($1.opType, $2, $1.lineNr); }
            | expr PLUSOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr MINUSOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr MULDIVOP expr								{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr ANDOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr OROP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr EQOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr LELTOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            |'(' expr ')'									{ $$ = $2; }
            | ID '(' actuals ')'								{ $$ = mFuncCallExpr($3, $1.strVal, $1.lineNr); }
            | ID										{ $$ = mRValue($1.strVal, $1.lineNr); }
            | INT_CONST										{ $$ = mIntConst($1.intVal, $1.lineNr); }
            | BOOL_CONST									{ $$ = mBoolConst($1.intVal, $1.lineNr); }
            | STRING_CONST									{ $$ = mStringConst($1.strVal, $1.lineNr); }
            ;

actuals     : exprs										{ $$ = $1; }
            |											{ $$ = NULL; }
            ;

exprs       : exprs ',' expr									{ $$ = connectActuals($1, mActual($3)); }
            | expr										{ $$ = mActual($1); }
            ;

%%
int main (int argc, char *argv[])
{
   int syntax_errors;
   char *p, *objname, *basename, *lstname;
   t_symtable *symbolTable;
   eType typeRet;

   symbolTable = NULL;

   if (argc <= 1) {
      fprintf (stderr, "No source file specified.\n");
   } else {
      yyin = fopen (argv[1], "r+");
      if (yyin == NULL) {
         fprintf (stderr, "Could not open input file %s\n", argv[1]);
      } else {
         basename = malloc(strlen(argv[1]) + 5);
         strcpy(basename, argv[1]);
         p = strstr (basename, ".t42");
         if (p) {
            *p = 0;
         }
         objname = malloc(strlen(basename) + 5);
         lstname = malloc(strlen(basename) + 6);
         strcpy(objname, basename);
         strcpy(lstname, basename);
         strcat(objname, ".obj");
         strcat(lstname, "_.lst");
		 printf("Building AST...\n");
         syntax_errors = yyparse();
         if (!syntax_errors) {
			
			// pass 1 - generate trac42 code back from AST
			printf("Generating trac42 code from AST to file \"generatedcode.t42\"...\n");
			genTrac42Traverse(treeRoot);

			//pass 2 - name analysis
			printf("Building symbol tables and performing name analysis...\n");
			symbolTable = nameAnalysis(treeRoot);
			if (nameErrorType > 0)
			{
				// name analysis error
				fprintf (stderr, "Name analysis found an error on line %d: '", nameErrorLineNr);
				fprintf (stderr, nameErrorId);
				switch(nameErrorType)
				{
				case NAME_ERROR_TYPE_ALREADY_DEFINED:
					fprintf(stderr, "' is already declared.\n");
					break;
				case NAME_ERROR_TYPE_NOT_DEFINED:
					fprintf(stderr, "' is not declared.\n");
					break;
				default:
					break;
				}
			}
			else
			{
				// pass 3 - type control
				printf("Performing type control...\n");
				typeRet = typeControl(treeRoot, symbolTable);
				if (typeRet != VOID)
				{
					fprintf (stderr, "Type mismatch on line %d.\n", typeErrorLineNr);
				}
				else
				{
					// pass 4 - offset calculations
					printf("Calculating offsets for IDs...\n");
					offsetCalc(treeRoot, symbolTable);

					// pass 5 - generate list file
					printf("Generating trac42 stack machine code to file \"");
					printf(lstname);
					printf("\"... ");
					generateSMC(treeRoot, symbolTable, lstname);
					printf("Done!\n");
					printf("Cleaning up and exiting...\n");
				}
			}
				
			
            //fprintf (stderr, "The answer is 42\n");
         } else {
            fprintf (stderr, "There were syntax errors.\n");
         }
		 destroyTables(symbolTable);
		 destroy_tree(treeRoot);
         free(basename);
         free(objname);
         free(lstname);
      }
   }
   system("pause");
   return 0;
}

int yyerror(const char *s)
{
   extern int yylineno;
   fprintf (stderr, "A %s at line %d\n",s, yylineno);
   return 0;
}

