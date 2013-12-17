/* FILE:       naiada.y
   CONTENTS:   naiada.y - This is the syntax analysator for the NaiAda language
   AUTHOR:     Per-Erik Måhl

   DESCRIPTION: Compiler skeleton used in a compiler theory course. To be translated by Bison
                and compiled to a syntax checker. Contains the basics for syntax checking. To
                be extended with semantic rules for building an AST, and calls to name analysis,
                type analysis, offset calculation and code generation. Plug in trac42.l as scanner.

   DESCRIPTION: Based on the lab 3 skeleton used in a compiler theory course at
		Mälardalen University. To be translated by Bison
                and compiled to a syntax checker. Contains syntax checking, semantic rules for 
		building an AST, name analysis, type analysis, offset calculation and stack machine
		code generation. Plug in naiada.l as scanner.
*/

%{
#include <stdio.h>
#include <malloc.h>
#include <stddef.h>
#include <string.h>
#include "ast.h"        /* Data structures and constructors for the AST */
#include "naiada.h"     /* Various definitions */
#include "symtab.h"
#include "naiada.y.h"   /* Declaration of tokens, genereated by bison. */
#include "regennaiada.h"
#include "name.h"
#include "types.h"
#include "offset.h"
#include "gensmc.h"

extern FILE *yyin;
int yyerror(const char *s);
void showManual();
int yylex(void);

%}
/* Alternative types of teh elements on the parse-value stack */
%union {
   t_tree       yyNode;
   floatStruct  yyFloat;
   intStruct    yyInt;
   compStruct	yyComp;
   stringStruct yyString;
   typeStruct   yyType;
   opStruct     yyOperator;
   int          yyLineNr;
};

/* Specifies operator precedence and what's on parse stack for these operators */
%left  <yyOperator> OROP
%left  <yyOperator> ANDOP
%left  <yyOperator> EQOP
%left  <yyOperator> LELTOP MEMTOP
%left  <yyOperator> MINUSOP PLUSOP
%left  <yyOperator> MULDIVOP
%right <yyOperator> NOTOP UNOP
%nonassoc '['
%nonassoc ','

/* Rule types on parse stack */
%type  <yyNode>   program functions function formals formal
%type  <yyNode>   decls decl stmnts stmnt expr actuals exprs
%type  <yyNode>   comp_units primitive prim_decls prim_decl
%type  <yyType>   type
%type  <yyOperator> unaryop

/* Specifies the types of other tokens than the operators, when on the parse stack */
%token <yyType>   BASIC_TYPE
%token <yyString> ID BOOL_CONST STRING_CONST
%token <yyComp>	  VEC_COMP MAT_COMP
%token <yyInt>    INT_CONST
%token <yyFloat>  FLOAT_CONST
%token <yyLineNr> IF THEN ELSE WHILE RETURN END EXIT LOOP PROCEDURE FUNCTION IS BGN ASSIGN ASM ADDR_TYPE NULL_STMNT LBL_LEFT LBL_RIGHT GOTO PRIMITIVE IN OUT
%token <yyOperator> MATH_TYPE

%start program

%%

program     : comp_units 									{ treeRoot = mProgram($1); }
            ;

comp_units  : comp_units function								{ $$ = connectCompUnits($1, $2); }
	    | comp_units primitive								{ $$ = connectCompUnits($1, $2); }
	    | function										{ $$ = $1; }
	    | primitive										{ $$ = $1; }
	    ;


functions   : functions function								{ $$ = connectFunctions($1, $2); }
	    | function										{ $$ = $1; }
	    ;


primitive   : PRIMITIVE ID IS prim_decls functions END ID ';'					{ if (strcmp($2.strVal, $7.strVal) != 0) { yyerror("syntax error"); YYERROR; } else $$ = mPrimitive($4, $5, $2.strVal, $2.lineNr); }
	    ;

function    : PROCEDURE ID '(' formals ')' IS decls BGN stmnts END ID ';'			{ if (strcmp($2.strVal, $11.strVal) != 0) { yyerror("syntax error"); YYERROR; } else $$ = mFunction(connectVariables($4, $7), $9, $2.strVal, VOID, $2.lineNr); }
            | PROCEDURE ID IS decls BGN stmnts END ID ';' 					{ if (strcmp($2.strVal, $8.strVal) != 0) { yyerror("syntax error"); YYERROR; } else $$ = mFunction($4, $6, $2.strVal, VOID, $2.lineNr); }
            | FUNCTION ID '(' formals ')' RETURN BASIC_TYPE IS decls BGN stmnts END ID ';'	{ if (strcmp($2.strVal, $13.strVal) != 0) { yyerror("syntax error"); YYERROR; } else $$ = mFunction(connectVariables($4, $9), $11, $2.strVal, $7.type, $2.lineNr); }
            | FUNCTION ID RETURN BASIC_TYPE IS decls BGN stmnts END ID ';' 			 { if (strcmp($2.strVal, $10.strVal) != 0) { yyerror("syntax error"); YYERROR; } else $$ = mFunction($6, $8, $2.strVal, $4.type, $2.lineNr); } 
            ;  


prim_decls  : prim_decls prim_decl								{ $$ = connectVariables($1, $2); }
	    | prim_decl										{ $$ = $1; }
	    ;

prim_decl   : ID ':' IN BASIC_TYPE ';'								{ $$ = mVariable(kLocal, $1.strVal, $4.type, $1.lineNr); }
	    | ID ':' OUT BASIC_TYPE ';'								{ $$ = mVariable(kFormal, $1.strVal, $4.type, $1.lineNr); }
	    ;

formals     : formals ';' formal								{ $$ = connectVariables($1,$3); }
            | formal										{ $$ = $1; }
            ;

formal      : ID ':' type	 								{ $$ = mVariable(kFormal, $1.strVal, $3.type, $1.lineNr); }
            ;

decls       : decls decl									{ if ($1 != NULL) { $$ = connectVariables($1, $2); } else { $$ = $2; } }
            |											{ $$ = NULL; }
            ;

decl        : ID ':' type ';'   								{ $$ = mVariable(kLocal, $1.strVal, $3.type, $1.lineNr); }
            ;

type	    : BASIC_TYPE									{ $$ = $1; }
	    | ADDR_TYPE '(' BASIC_TYPE ')'							{ $$.lineNr = $1; $$.type = $3.type + MATRIX; }
	    ;

stmnts      : stmnts stmnt									{ $$ = connectStmnts($1,$2); }
            | stmnt										{ $$ = $1; }
            ;

stmnt       : ID ASSIGN expr ';'                       						{ $$ = mAssign($1.strVal, $3, $1.lineNr); }
            | ASM '(' STRING_CONST ')' ';' 							{ $$ = mAsm($3.strVal, $1); }
            | IF expr THEN stmnts END IF ';' 							{ $$ = mIf($2, $4, NULL, $1); }
            | IF expr THEN stmnts ELSE stmnts END IF ';'					{ $$ = mIf($2, $4, $6, $1); }
            | WHILE expr LOOP stmnts END LOOP ';'						{ $$ = mWhile($2, $4, $1); }
            | RETURN expr ';'                       						{ $$ = mReturn($2, $1); }
            | RETURN ';'                       							{ $$ = mReturn(NULL, $1); }
            | ID '(' actuals ')' ';'                						{ $$ = mFuncCallStmnt($3, $1.strVal, $1.lineNr); }
            | LOOP stmnts END LOOP ';'                						{ $$ = mLoop($2, $1); }
            | EXIT ';'    		            						{ $$ = mExit($1); }
	    | NULL_STMNT ';'									{ $$ = mAsm("NULL", $1); }
	    | LBL_LEFT ID LBL_RIGHT								{ $$ = mLabel($2.strVal, $1); }
	    | GOTO ID ';'									{ $$ = mGoto($2.strVal, $1); }
            ;

expr        : MINUSOP expr %prec UNOP								{ $$ = mUnary($1.opType, $2, $1.lineNr); }
            | NOTOP expr									{ $$ = mUnary($1.opType, $2, $1.lineNr); }
            | unaryop '(' expr ')' %prec UNOP							{ $$ = mUnary($1.opType, $3, $1.lineNr); }
            | expr PLUSOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr MINUSOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr MULDIVOP expr								{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr ANDOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr OROP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr EQOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr LELTOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            | expr MEMTOP expr									{ $$ = mBinary($1, $2.opType, $3, $2.lineNr); }
            |'(' expr ')'									{ $$ = $2; }
            | ID '(' actuals ')'								{ $$ = mFuncCallExpr($3, $1.strVal, $1.lineNr); }
            | ID										{ $$ = mRValue($1.strVal, $1.lineNr); }
	    | ADDR_TYPE '(' ID ')'								{ $$ = mLValue($3.strVal, $1); }
            | INT_CONST										{ $$ = mIntConst($1.intVal, $1.lineNr); }
            | BOOL_CONST									{ $$ = mBoolConst($1.strVal, $1.lineNr); }
            | FLOAT_CONST									{ $$ = mFloatConst($1.floatVal, $1.lineNr); }
            | '[' expr ',' expr ',' expr ']' 	%prec '['					{ $$ = mVecValue($2, $4, $6); }
            | '[' '[' expr ',' expr ',' expr ']' ',' 
	          '[' expr ',' expr ',' expr ']' ',' 
                  '[' expr ',' expr ',' expr ']' ']' 						{ $$ = mMatValue($3, $5, $7, 
													         $11, $13, $15, 
														 $19, $21, $23); }
	    | VEC_COMP										{ $$ = mCompValue($1.strVal, $1.lineNr, $1.iComponent, VECTOR); }
	    | MAT_COMP										{ $$ = mCompValue($1.strVal, $1.lineNr, $1.iComponent, MATRIX); }
            ;

unaryop	    : BASIC_TYPE									{ $$.opType = ($1.type == INT ? INTOP : ($1.type == FLOAT ? FLOATOP : ERROP)); $$.lineNr = $1.lineNr; }
	    | MATH_TYPE										{ $$ = $1; }
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
	int syntax_errors, bVerbose, bRegenerateCode;
	char *basename, *smcname;
	t_symtable *symbolTable;
	eType typeRet;

	symbolTable = NULL;
	bVerbose = 0;
	bRegenerateCode = 0;

	switch (argc)
	{
	case 1:
		fprintf (stderr, "No source file specified.\n");
		showManual();
		printf("\n");
		return 1;
	case 2:
		yyin = fopen (argv[1], "r+");
		if (yyin == NULL) 
		{
			fprintf (stderr, "Could not open input file %s\n", argv[1]);	
			showManual();
			printf("\n");
			return 1;
		}
		basename = malloc(strlen(argv[1]) + 1);
		strcpy(basename, argv[1]);
		basename[strlen(basename)] = 0;

		break;
	case 3:
		yyin = fopen (argv[2], "r+");
		if (yyin == NULL) 
		{
			fprintf (stderr, "Could not open input file %s\n", argv[2]);	
			showManual();
			printf("\n");
			return 1;
		}
		basename = malloc(strlen(argv[2]) + 1);
		strcpy(basename, argv[2]);
		basename[strlen(basename)] = 0;

		if (argv[1][0] == '-')
		{
			argv[1]++;
			while (argv[1][0] != 0)
			{
				switch (argv[1][0])
				{
					case 'v':
						bVerbose = 1;
						break;
					case 'g':
						bRegenerateCode = 1;
						break;
					default:
						showManual();
						printf("\n");
						return 1;								
				}
				argv[1]++;
			}
		}
		else
		{
			showManual();
			printf("\n");
			return 1;
		}
	}


	smcname = malloc(strlen(basename) + 5);
	strcpy(smcname, basename);
	strcat(smcname, ".nmc");
	smcname[strlen(smcname)] = 0;	

	syntax_errors = yyparse();
	if (!syntax_errors) 
	{		
		if (bRegenerateCode) // pass 1 - regenerate NaiAda code back from AST
		{
			if (bVerbose)
				printf("Regenerating NaiAda code from AST to file \"regeneratedcode.nai\"... ");
			regenNaiAda(treeRoot);
			if (bVerbose)
				printf("DONE.\n");
		}

		//pass 2 - name analysis
		if (bVerbose)
			printf("Building symbol tables and performing name analysis... ");
		symbolTable = nameAnalysis(treeRoot);
		if (nameErrorType > 0)
		{
			if (bVerbose)
				printf("\n");
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
			if (bVerbose)
				printf("DONE.\n");

			// pass 3 - type analysis
			if (bVerbose)
				printf("Performing type control... ");
			typeRet = typeControl(treeRoot, symbolTable);
			if (typeRet != VOID)
			{
				fprintf (stderr, "Type mismatch on line %d.\n", typeErrorLineNr);
			}
			else
			{
				if (bVerbose)
					printf("DONE.\n");
				
				// pass 4 - offset calculations
				if (bVerbose)
					printf("Calculating offsets for IDs... ");
				offsetCalc(treeRoot, symbolTable);


				if (bVerbose)
					printf("DONE.\n");

				// pass 5 - generate stack machine code
				if (bVerbose)
				{
					printf("Generating NaiAda VM stack machine code to file \"");
					printf(smcname);
					printf("\"... ");
				}
				generateSMC(treeRoot, symbolTable, smcname);

				if (bVerbose)
				{
					printf("DONE.\n");
					printf("Cleaning up and exiting...\n");
				}
				
			}
			destroyTables(symbolTable);
		}
		destroy_tree(treeRoot);
	 }
	free(basename);
	free(smcname);

	printf("\n");
	return 0;
}

int yyerror(const char *s)
{
   extern int yylineno;
   fprintf (stderr, "A %s at line %d\n",s, yylineno);
   return 0;
}

void showManual()
{
	printf("\nUsage: naiada [-gv] source\n\n");
	printf("g	Regenerate NaiAda code from abstract syntax tree.\n");
	printf("v	Verbose.\n\n");
}

