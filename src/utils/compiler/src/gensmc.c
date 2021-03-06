/* FILE:       gensmc.c
   CONTENTS:   gensmc.c - This generates stack machine code for NaiAda compiler
   AUTHOR:     Per-Erik Måhl
*/

#include "symtab.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "ast.h"
#include "gensmc.h"

int genSMCLineNr; // keeps track of the current line number in the list file
int genSMCTabIndex;	// keeps track of the tabs
int exitLoopAddress;	// keeps track of the address to jump to to get out of a loop stmnt
FILE * genSMCFilePtr;	// pointer to opened list file

// -----------------------------------------------------------------------------------

// helper functions
void genSMCInsertTab();
void genSMCRemoveTab();
void genSMCNewLine();



void genSMC_NULL();
void genSMC_MAIN();

void genSMC_LINK();
void genSMC_UNLINK();

void genSMC_BRF(int iAddress);
void genSMC_BRA(int iAddress);

void genSMC_BSR(); // (int iAddress); Comment: Now pops address from stack instead
void genSMC_RTS();
void genSMC_EOF();

void genSMC_DECL();
void genSMC_DECLINT();
void genSMC_DECLBOOL();
void genSMC_DECLFLOAT();
void genSMC_DECLMAT();
void genSMC_DECLVEC();

void genSMC_POP(eType type);

void genSMC_PUSHFP();
void genSMC_PUSHINT(int iValue);
void genSMC_PUSHBOOL(const char * pValue);
void genSMC_PUSHFLOAT(float fValue);
void genSMC_PUSHMAT();
void genSMC_PUSHVEC();


// rval uses address from top of stack instead of argument
void genSMC_RVALINT();
void genSMC_RVALBOOL();
void genSMC_RVALFLOAT();
void genSMC_RVALMAT();
void genSMC_RVALVEC();

void genSMC_LVAL(int iAddress);

void genSMC_ASSINT();
void genSMC_ASSBOOL();
void genSMC_ASSFLOAT();
void genSMC_ASSMAT();
void genSMC_ASSVEC();

void genSMC_TIMERST();
void genSMC_TIME();

void genSMC_EQINT();
void genSMC_LTINT();
void genSMC_LEINT();

void genSMC_EQFLOAT();
void genSMC_LTFLOAT();
void genSMC_LEFLOAT();

void genSMC_NOT();
void genSMC_OR();
void genSMC_AND();
void genSMC_EQBOOL();

void genSMC_EQMAT();

void genSMC_EQVEC();

void genSMC_NEGINT();
void genSMC_ADDINT();
void genSMC_DIVINT();
void genSMC_MULINT();

void genSMC_NEGFLOAT();
void genSMC_ADDFLOAT();
void genSMC_DIVFLOAT();
void genSMC_MULFLOAT();

void genSMC_NEGVEC();
void genSMC_ADDVEC();
void genSMC_MULVEC();
void genSMC_SCALEVEC();

void genSMC_VECCOMP(int iComponent);

void genSMC_MULMAT();
void genSMC_MULMATVEC();

void genSMC_SIN();
void genSMC_COS();
void genSMC_ARCSIN();
void genSMC_ARCCOS();
void genSMC_SQRT();
void genSMC_ABSINT();
void genSMC_ABSFLOAT();

void genSMC_ITOF();
void genSMC_FTOI();

void genSMC_ASM();

void genSMC_FunctionBegin();
void genSMC_FunctionEnd();

void genSMCPopArgs(t_symtable * table_iter);
void genSMCPopVars(t_symtable * table_iter);

// AST traversion functions
void genSMCCallNodeFunction(t_tree node);
void genSMCVariable(t_tree node);
void genSMCProgram(t_tree node);
void genSMCPrimitive(t_tree node);
void genSMCFunction(t_tree node);
void genSMCFormal(t_tree node);
void genSMCLocal(t_tree node);
void genSMCAssign(t_tree node);
void genSMCIf(t_tree node);
void genSMCWhile(t_tree node);
void genSMCReturn(t_tree node);
void genSMCLoop(t_tree node);
void genSMCExit(t_tree node);
void genSMCAsm(t_tree node);
void genSMCLabel(t_tree node);
void genSMCFuncCallStmnt(t_tree node);
void genSMCFuncCallExpr(t_tree node);
void genSMCActual(t_tree node);
void genSMCUnary(t_tree node);
void genSMCBinary(t_tree node);
void genSMCIntConst(t_tree node);
void genSMCFloatConst(t_tree node);
void genSMCVecValue(t_tree node);
void genSMCMatValue(t_tree node);
void genSMCBoolConst(t_tree node);
void genSMCRValue(t_tree node);
void genSMCLValue(t_tree node);
void genSMCCompValue(t_tree node);
void genSMCGoto(t_tree node);


//----------------------------------------------------------------------------------------------------------

void genSMCInsertTab()
{
	genSMCTabIndex++;
}

void genSMCRemoveTab()
{
	genSMCTabIndex--;
}
void genSMCNewLine()
{
	int tmp;
	int i = genSMCTabIndex + 1;
	int spaces = 6;
	genSMCLineNr++;
	tmp = genSMCLineNr;

	do
	{
		tmp /= 10;
		spaces--;
	} while (tmp > 0);

	if (genSMCLineNr > 2)
		fprintf(genSMCFilePtr, "\n");
	do
	{
		fprintf(genSMCFilePtr, " ");
		spaces--;
	} while (spaces > 0);
	fprintf(genSMCFilePtr, "%d", genSMCLineNr);

	while (i > 0)
	{
		fprintf(genSMCFilePtr, "  ");
		i--;
	}
}

void genSMC_LINK()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LINK");
}
void genSMC_UNLINK()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "UNLINK");
}

void genSMC_BRF(int iAddress)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "BRF %d", iAddress);
}
void genSMC_BRA(int iAddress)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "BRA %d", iAddress);
}


void genSMC_BSR() // (int iAddress); Comment: Now pops address from stack instead
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "BSR");	
}

void genSMC_RTS()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RTS");
}
void genSMC_EOF()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "EOF");
}


void genSMC_DECLINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "DECLINT");
}
void genSMC_DECLBOOL()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "DECLBOOL");
}
void genSMC_DECLFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "DECLFLOAT");
}
void genSMC_DECLMAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "DECLMAT");
}
void genSMC_DECLVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "DECLVEC");
}
void genSMC_DECL(eType type)
{
	switch (type)
	{
	case INT:
	case BOOL_ADDR:
	case INT_ADDR:
	case FLOAT_ADDR:
	case VECTOR_ADDR:
	case MATRIX_ADDR:
		genSMC_DECLINT();
		break;
	case BOOL:
		genSMC_DECLBOOL();
		break;
	case FLOAT:
		genSMC_DECLFLOAT();
		break;
	case VECTOR:
		genSMC_DECLVEC();
		break;
	case MATRIX:
		genSMC_DECLMAT();
		break;
	case VOID:
		break;
	default:
		// error
		printf("\nError when creating SMC file.\n");
		break;		
	}
}


void genSMC_POP(eType type)
{
	genSMCNewLine();
	switch (type)
	{
	case INT:
	case BOOL_ADDR:
	case INT_ADDR:
	case FLOAT_ADDR:
	case VECTOR_ADDR:
	case MATRIX_ADDR:
		fprintf(genSMCFilePtr, "POPINT");
		break;

	case BOOL:
		fprintf(genSMCFilePtr, "POPBOOL");
		break;

	case FLOAT:
		fprintf(genSMCFilePtr, "POPFLOAT");
		break;

	case VECTOR:
		fprintf(genSMCFilePtr, "POPVEC");
		break;

	case MATRIX:
		fprintf(genSMCFilePtr, "POPMAT");
		break;

	default:
		printf("Error in SMC generation.");
		break;
	}
}

void genSMC_PUSHFP()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHFP");
}
void genSMC_PUSHINT(int iValue)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHINT %d", iValue);
}
void genSMC_PUSHBOOL(const char * pValue)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHBOOL ");
	fprintf(genSMCFilePtr, pValue);
}
void genSMC_PUSHFLOAT(float fValue)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHFLOAT %f", fValue);
}
void genSMC_PUSHMAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHMAT");
}
void genSMC_PUSHVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHVEC");
}


void genSMC_RVALINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RVALINT");
}
void genSMC_RVALBOOL()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RVALBOOL");
}
void genSMC_RVALFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RVALFLOAT");
}
void genSMC_RVALMAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RVALMAT");
}
void genSMC_RVALVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RVALVEC");
}

void genSMC_LVAL(int iAddress)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LVAL %d", iAddress);
}

void genSMC_ASSINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ASSINT");
}
void genSMC_ASSBOOL()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ASSBOOL");
}
void genSMC_ASSFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ASSFLOAT");
}
void genSMC_ASSMAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ASSMAT");
}
void genSMC_ASSVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ASSVEC");
}

void genSMC_TIMERST()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "TIMERST");
}
void genSMC_TIME()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "TIME");
}

void genSMC_EQINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "EQINT");
}
void genSMC_LTINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LTINT");
}
void genSMC_LEINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LEINT");
}

void genSMC_EQFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "EQFLOAT");
}
void genSMC_LTFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LTFLOAT");
}
void genSMC_LEFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LEFLOAT");
}

void genSMC_NOT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "NOT");
}
void genSMC_OR()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "OR");
}
void genSMC_AND()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "AND");
}
void genSMC_EQBOOL()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "EQBOOL");
}

void genSMC_EQMAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "EQMAT");
}

void genSMC_EQVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "EQVEC");
}

void genSMC_NEGINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "NEGINT");
}
void genSMC_ADDINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ADDINT");
}
void genSMC_MULINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "MULINT");
}
void genSMC_DIVINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "DIVINT");
}

void genSMC_NEGFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "NEGFLOAT");
}
void genSMC_ADDFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ADDFLOAT");
}
void genSMC_MULFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "MULFLOAT");
}
void genSMC_DIVFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "DIVFLOAT");
}

void genSMC_NEGVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "NEGVEC");
}
void genSMC_ADDVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ADDVEC");
}
void genSMC_MULVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "MULVEC");
}

void genSMC_VECCOMP(int iComponent)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "VECCOMP %d", iComponent);
}

void genSMC_MULMAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "MULMAT");
}

void genSMC_SIN()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "SIN");
}
void genSMC_COS()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "COS");
}
void genSMC_ARCSIN()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ARCSIN");
}
void genSMC_ARCCOS()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ARCCOS");
}
void genSMC_SQRT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "SQRT");
}
void genSMC_ABSINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ABSINT");
}
void genSMC_ABSFLOAT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ABSFLOAT");
}



void genSMC_ITOF()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ITOF");
}
void genSMC_FTOI()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "FTOI");
}

void genSMC_SCALEVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "SCALEVEC");
}
void genSMC_MULMATVEC()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "MULMATVEC");
}

void genSMC_ASM(const char * pArg)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, pArg);
}



// ----------------------------------------------------------------------------------




void genSMC_FunctionBegin()
{
	genSMCNewLine();

	scope->offset = genSMCLineNr; // spar rad offset fr funktionen s man kan kalla p den
	fprintf(genSMCFilePtr,"["); fprintf(genSMCFilePtr, scope->id); fprintf(genSMCFilePtr, "]");

	genSMCInsertTab();
	genSMC_LINK();
}
void genSMC_FunctionEnd()
{
	genSMC_UNLINK();
	if (strcmp(scope->id, "main") != 0)
		genSMC_RTS();
	else
		genSMC_EOF();
	genSMCRemoveTab();
}


void genSMCCallNodeFunction(t_tree node)
{
	if (node == NULL)
		return;

	switch(node->Kind)
	{
	case kProgram:
		genSMCProgram(node);
		break;
	case kPrimitive:
		genSMCPrimitive(node);
		break;
	case kFunction:
		genSMCFunction(node);
		break;
	case kAssign:
		genSMCAssign(node);
		break;
	case kIf:
		genSMCIf(node);
		break;
	case kWhile:
		genSMCWhile(node);
		break;
	case kFuncCallStmnt:
		genSMCFuncCallStmnt(node);
		break;
	case kReturn:
		genSMCReturn(node);
		break;
	case kLoop:
		genSMCLoop(node);
		break;
	case kExit:
		genSMCExit(node);
		break;
	case kAsm:
		genSMCAsm(node);
		break;
	case kActual:
		genSMCActual(node);
		break;
	case kUnary:
		genSMCUnary(node);
		break;
	case kBinary:
		genSMCBinary(node);
		break;
	case kIntConst:
		genSMCIntConst(node);
		break;
	case kBoolConst:
		genSMCBoolConst(node);
		break;
	case kFloatConst:
		genSMCFloatConst(node);
		break;
	case kVecValue:
		genSMCVecValue(node);
		break;
	case kMatValue:
		genSMCMatValue(node);
		break;
	case kFuncCallExpr:
		genSMCFuncCallExpr(node);
		break;
	case kLValue:
		genSMCLValue(node);
		break;
	case kRValue:
		genSMCRValue(node);
		break;
	case kCompValue:
		genSMCCompValue(node);
		break;
	case kLabel:
		genSMCLabel(node);
		break;
	case kGoto:
		genSMCGoto(node);
		break;
	default:
		printf("What? Type: %d\n", node->Kind);
		break;
	}
}

void genSMCProgram(t_tree node)
{
	long int brfFileOffset;

	brfFileOffset = ftell(genSMCFilePtr); // get current position in output file
	
	genSMCCallNodeFunction(node->Node.Program.CompUnits);

	fseek(genSMCFilePtr, brfFileOffset, SEEK_SET);	
	genSMCTabIndex = 0;
	genSMCLineNr = 1;

	genSMCCallNodeFunction(node->Node.Program.CompUnits);
}

void genSMCPrimitive(t_tree node)
{
	if (node == NULL)
		return;

	genSMCCallNodeFunction(node->Node.Primitive.Functions);
	genSMCCallNodeFunction(node->Node.Primitive.Next);
}


void genSMCPopVars(t_symtable * table_iter)
{
	if (table_iter != NULL)
	{
		if (table_iter->offset < 0) // means this is func local var
		{
			// the order DOES matter now
			genSMC_POP(table_iter->type);
		}		
		genSMCPopVars(table_iter->next);
	}
}

void genSMCLabel(t_tree node)
{
	t_symtable * lbl_table;
	lbl_table = FindId(node->Node.Label.Id, scope);

	if (lbl_table != NULL)
	{		
		genSMCNewLine();
		if (lbl_table->offset == 0)
			lbl_table->offset = genSMCLineNr;
		fprintf(genSMCFilePtr,"["); fprintf(genSMCFilePtr, lbl_table->id); fprintf(genSMCFilePtr, "]");
	}
	else
		printf("Error writing smc\n");

	genSMCCallNodeFunction(node->Node.Label.Next);	
}

void genSMCGoto(t_tree node)
{
	t_symtable * lbl_table;
	long int braFileOffset;
	int brfLineNr = genSMCLineNr;
	
	braFileOffset = ftell(genSMCFilePtr);

	genSMC_BRA(0);
	genSMCCallNodeFunction(node->Node.Goto.Next);	

	fseek(genSMCFilePtr, braFileOffset, SEEK_SET);
	genSMCLineNr = brfLineNr;


	lbl_table = FindId(node->Node.Goto.Id, scope);

	if (lbl_table != NULL)
		genSMC_BRA(lbl_table->offset);
	else
		printf("Error writing smc\n");

	genSMCCallNodeFunction(node->Node.Goto.Next);	
}

void genSMCFunction(t_tree node)
{
	t_tree var_iter;
	//int offset;
	//t_symtable * var_table;

	if (node == NULL)
		return;

	scope = FindId(node->Node.Function.Name, scope);
	
	genSMC_FunctionBegin();
	
	// iterate local vars
	var_iter = node->Node.Function.Variables;
	while (var_iter != NULL)
	{
		if (var_iter->Node.Variable.VarKind == kLocal)
		{
			//var_table = FindId(var_iter->Node.Variable.Name, scope);
			genSMC_DECL(var_iter->Node.Variable.Type); // allocate space for them
		}
		var_iter = var_iter->Node.Variable.Next;
	}

	// go through list of stmnts for this func
	genSMCCallNodeFunction(node->Node.Function.Stmnts);

	genSMCPopVars(scope->child);

	genSMC_FunctionEnd();
	scope = scope->parent;

	// go to next func
	genSMCCallNodeFunction(node->Node.Function.Next);
}


void genSMCAssign(t_tree node)
{
	t_symtable * var_table = FindId(node->Node.Assign.Id,scope);
	eType type = var_table->type;

	genSMC_PUSHINT(var_table->offset);
	genSMC_PUSHFP();
	genSMC_ADDINT();

	if (type > MATRIX && type < ERROR_TYPE)
		genSMC_RVALINT();

	genSMCCallNodeFunction(node->Node.Assign.Expr);
	
	switch(var_table->type)
	{
	case INT:
	case INT_ADDR:
		genSMC_ASSINT();
		break;
	case BOOL:
	case BOOL_ADDR:
		genSMC_ASSBOOL();
		break;
	case FLOAT:
	case FLOAT_ADDR:
		genSMC_ASSFLOAT();
		break;
	case VECTOR:
	case VECTOR_ADDR:
		genSMC_ASSVEC();
		break;
	case MATRIX:
	case MATRIX_ADDR:
		genSMC_ASSMAT();
		break;
	default:
		printf("Error in SMC generation.");
		break;
	}

	genSMCCallNodeFunction(node->Node.Assign.Next);
}


void genSMCIf(t_tree node)
{
	long int brfFileOffset;
	int brfLineNr, brfJump, braJump;
	
	genSMCCallNodeFunction(node->Node.If.Expr);
	brfFileOffset = ftell(genSMCFilePtr); // get current position in output file
	brfLineNr = genSMCLineNr;	// get current line number so we can reset to this after dummies

	// DUMMIES--------------------------------------------
	genSMC_BRF(0);
	genSMCCallNodeFunction(node->Node.If.Then);
	genSMC_BRA(0);
	brfJump = genSMCLineNr + 1; // branch false jump to address
	genSMCCallNodeFunction(node->Node.If.Else);
	braJump = genSMCLineNr + 1; // branch always after true stmnt to get after false stmnt
	//----------------------------------------------------

	fseek(genSMCFilePtr, brfFileOffset, SEEK_SET); // seek file back to before dummies
	genSMCLineNr = brfLineNr; // reset line number
	
	// do it for real this time
	genSMC_BRF(brfJump);
	genSMCCallNodeFunction(node->Node.If.Then);
	genSMC_BRA(braJump);
	genSMCCallNodeFunction(node->Node.If.Else);
	
	genSMCCallNodeFunction(node->Node.If.Next);
}

void genSMCWhile(t_tree node)
{
	long int brfFileOffset;
	int brfLineNr, brfJump;
	int loopingAddress = genSMCLineNr + 1;
	
	genSMCCallNodeFunction(node->Node.While.Expr);
	brfFileOffset = ftell(genSMCFilePtr);
	brfLineNr = genSMCLineNr;

	// DUMMIES--------------------------------------------
	genSMC_BRF(0);
	genSMCCallNodeFunction(node->Node.While.Stmnt);
	genSMC_BRA(loopingAddress);
	brfJump = genSMCLineNr + 1;
	//----------------------------------------------------

	fseek(genSMCFilePtr, brfFileOffset, SEEK_SET);
	genSMCLineNr = brfLineNr;
	
	genSMC_BRF(brfJump);
	genSMCCallNodeFunction(node->Node.While.Stmnt);
	genSMC_BRA(loopingAddress);

	genSMCCallNodeFunction(node->Node.While.Next);
}

void genSMCLoop(t_tree node)
{
	long int braFileOffset;
	int brfLineNr, exitJump;
	int loopingAddress = genSMCLineNr + 1;
	
	braFileOffset = ftell(genSMCFilePtr);
	brfLineNr = genSMCLineNr;

	// DUMMIES--------------------------------------------
	genSMCCallNodeFunction(node->Node.Loop.Stmnt);
	genSMC_BRA(loopingAddress);
	exitJump = genSMCLineNr + 1;
	//----------------------------------------------------

	fseek(genSMCFilePtr, braFileOffset, SEEK_SET);
	genSMCLineNr = brfLineNr;
	
	exitLoopAddress = exitJump;
	genSMCCallNodeFunction(node->Node.Loop.Stmnt);
	genSMC_BRA(loopingAddress);

	genSMCCallNodeFunction(node->Node.While.Next);
}

void genSMCExit(t_tree node)
{
	genSMC_BRA(exitLoopAddress);
	genSMCCallNodeFunction(node->Node.Exit.Next);
}

void genSMCReturn(t_tree node)
{
	int retValOffset;
	//int size;
	t_symtable * var_iter;
	
	// figure out the offset of the return value address
	retValOffset = 2;
	var_iter = scope->child;
	while (var_iter != NULL)
	{
/*
		switch (var_iter->type)
		{
		case BOOL:
		case INT:
			size = 1;
			break;
		case STRING:
			size = 100;
			break;
		}
*/
		
		if (var_iter->offset > 0 && var_iter->offset + 1 > retValOffset)
			retValOffset = var_iter->offset + 1;
		var_iter = var_iter->next;
	}


	if (scope->type != VOID)
	{
		genSMC_PUSHINT(retValOffset);
		genSMC_PUSHFP();
		genSMC_ADDINT();

		genSMCCallNodeFunction(node->Node.Return.Expr);
		switch (scope->type)
		{
		case INT:
			genSMC_ASSINT();
			break;
		case BOOL:
			genSMC_ASSBOOL();
			break;
		case FLOAT:
			genSMC_ASSFLOAT();
			break;
		case VECTOR:
			genSMC_ASSVEC();
			break;
		case MATRIX:
			genSMC_ASSMAT();
			break;
		default:
			printf("Error generating smc file.");
			break;
		}
	}


	genSMCPopVars(scope->child);

	genSMC_UNLINK();
	genSMC_RTS();
	genSMCCallNodeFunction(node->Node.Return.Next);
}


void genSMCPopArgs(t_symtable * table_iter)
{
	if (table_iter != NULL)
	{
		genSMCPopArgs(table_iter->next);
		if (table_iter->offset > 0) // means this is func arg
		{
			// the order DOES matter now
			genSMC_POP(table_iter->type);
		}		
	}
}

void genSMCFuncCallStmnt(t_tree node)
{
	t_symtable * func_table;
	t_symtable * table_iter;
	//t_tree actual_iter;
	
	// get symtable for function
	table_iter = scope;
	while (table_iter != NULL)
	{
		func_table = FindId(node->Node.FuncCallStmnt.FuncName, table_iter);
		if (func_table != NULL)
			break;
		table_iter = table_iter->parent;
	}

	genSMC_DECL(func_table->type);

/*
	actual_iter = node->Node.FuncCallStmnt.Actuals;

	while (actual_iter != NULL)
	{
		genSMCCallNodeFunction(actual_iter->Node.Actual.Expr);
		actual_iter = actual_iter->Node.Actual.Next;
	}
*/
	genSMCCallNodeFunction(node->Node.FuncCallStmnt.Actuals);

	genSMC_PUSHINT(func_table->offset);
	genSMC_BSR();

	genSMCPopArgs(func_table->child);

/*
	table_iter = func_table->child;
	while(table_iter != NULL)
	{
		if (table_iter->offset > 0) // means this is func arg
		{
			// the order doesn't matter, all needs to be popped
			genSMC_POP(table_iter->type);
		}
		table_iter = table_iter->next;
	}
*/
	if (func_table->type != VOID)
		genSMC_POP(func_table->type); // pop return value
	genSMCCallNodeFunction(node->Node.FuncCallStmnt.Next);
}
void genSMCFuncCallExpr(t_tree node)
{
	t_symtable * func_table;
	t_symtable * table_iter;
	//t_tree actual_iter;
	
	// get symtable for function
	table_iter = scope;
	while (table_iter != NULL)
	{
		func_table = FindId(node->Node.FuncCallExpr.FuncName, table_iter);
		if (func_table != NULL)
			break;
		table_iter = table_iter->parent;
	}

	genSMC_DECL(func_table->type);

	/*
	actual_iter = node->Node.FuncCallExpr.Actuals;
	while (actual_iter != NULL)
	{
		genSMCCallNodeFunction(actual_iter->Node.Actual.Expr);
		actual_iter = actual_iter->Node.Actual.Next;
	}
	*/
	genSMCCallNodeFunction(node->Node.FuncCallExpr.Actuals);

	genSMC_PUSHINT(func_table->offset);
	genSMC_BSR();

	genSMCPopArgs(func_table->child);
/*
	table_iter = func_table->child;
	while(table_iter != NULL)
	{
		if (table_iter->offset > 0) // means this is func arg
		{
			// the order doesn't matter
			genSMC_POP(table_iter->type);
		}
		table_iter = table_iter->next;
	}
*/
}
void genSMCActual(t_tree node)
{
	// opposite order here to keep the offsets correct (but only for funccallexpr
	genSMCCallNodeFunction(node->Node.Actual.Next);
	genSMCCallNodeFunction(node->Node.Actual.Expr);
}
void genSMCUnary(t_tree node)
{
	genSMCCallNodeFunction(node->Node.Unary.Expr);
	switch(node->Node.Unary.Operator)
	{
	case NOT:
		genSMC_NOT();
		break;
	case NEG:
		switch (node->Node.Unary.Type)
		{
			case INT:
				genSMC_NEGINT();
				break;
			case FLOAT:
				genSMC_NEGFLOAT();
				break;
			case VECTOR:
				genSMC_NEGVEC();
				break;
			default:
				printf("Error generating smc file.");
				break;
		}
		break;
	case INTOP:
		genSMC_FTOI();
		break;
	case FLOATOP:
		genSMC_ITOF();
		break;
	case SIN:
		genSMC_SIN();
		break;
	case COS:
		genSMC_COS();
		break;
	case ASIN:
		genSMC_ARCSIN();
		break;
	case ACOS:
		genSMC_ARCCOS();
		break;
	case SQRT:
		genSMC_SQRT();
		break;
	case ABS:
		if (node->Node.Unary.Type == INT)
		{
			genSMC_ABSINT();
		}
		else if (node->Node.Unary.Type == FLOAT)
		{
			genSMC_ABSFLOAT();
		}
		break;
	default:
		printf("ERror in smc file.");
		break;
	}
}

// type in Binary node is set in type analysis pass.
// the type of a Binary node will be equal to the type of both operands
void genSMCBinary(t_tree node)
{
	if (node->Node.Binary.Type == VECTOR)
	{
		if (node->Node.Binary.RightType == MATRIX || node->Node.Binary.LeftType == FLOAT)
		{
			genSMCCallNodeFunction(node->Node.Binary.RightOperand);
			genSMCCallNodeFunction(node->Node.Binary.LeftOperand);
		}
		else
		{
			genSMCCallNodeFunction(node->Node.Binary.LeftOperand);
			genSMCCallNodeFunction(node->Node.Binary.RightOperand);
		}
	}
	else
	{
		genSMCCallNodeFunction(node->Node.Binary.LeftOperand);
		genSMCCallNodeFunction(node->Node.Binary.RightOperand);
	}
	switch (node->Node.Binary.Type)
	{
	case BOOL:
		switch (node->Node.Binary.Operator)
		{
		case OR:
			genSMC_OR();
			break;
		case AND:
			genSMC_AND();
			break;
		case EQ:
			genSMC_EQBOOL();
			break;
		default:
			printf("Error in smc");
			break;
		}
		break;
	case INT:
		switch (node->Node.Binary.Operator)
		{
		case PLUS:
			genSMC_ADDINT();
			break;
		case SUB:
			genSMC_NEGINT();
			genSMC_ADDINT();
			break;
		case DIV:
			genSMC_DIVINT();
			break;
		case MULT:
			genSMC_MULINT();
			break;
		case EQ:
			genSMC_EQINT();
			break;
		case LT:
			genSMC_LTINT();
			break;
		case LE:
			genSMC_LEINT();
			break;
		case MT:
			genSMC_LEINT();
			genSMC_NOT();
			break;
		case ME:
			genSMC_LTINT();
			genSMC_NOT();
			break;
		default:
			printf("Error in smc");
			break;
		}
		break;
	case FLOAT:
		switch (node->Node.Binary.Operator)
		{
		case PLUS:
			genSMC_ADDFLOAT();
			break;
		case SUB:
			genSMC_NEGFLOAT();
			genSMC_ADDFLOAT();
			break;
		case DIV:
			genSMC_DIVFLOAT();
			break;
		case MULT:
			genSMC_MULFLOAT();
			break;
		case EQ:
			genSMC_EQFLOAT();
			break;
		case LT:
			genSMC_LTFLOAT();
			break;
		case LE:
			genSMC_LEFLOAT();
			break;
		case MT:
			genSMC_LEFLOAT();
			genSMC_NOT();
			break;
		case ME:
			genSMC_LTFLOAT();
			genSMC_NOT();
			break;
		default:
			printf("Error in smc");
			break;
		}
		break;
	case VECTOR:
		switch (node->Node.Binary.Operator)
		{
		case PLUS:
			genSMC_ADDVEC();
			break;
		case SUB:
			genSMC_NEGVEC();
			genSMC_ADDVEC();
			break;
		case MULT:
			if (node->Node.Binary.LeftType == FLOAT || node->Node.Binary.RightType == FLOAT)
				genSMC_SCALEVEC();
			else if (node->Node.Binary.LeftType == MATRIX || node->Node.Binary.RightType == MATRIX)
				genSMC_MULMATVEC();
			else
				genSMC_MULVEC();
			break;
		case EQ:
			genSMC_EQVEC();
			break;
		default:
			printf("Error in smc");
			break;
		}
		break;
	case MATRIX:
		switch (node->Node.Binary.Operator)
		{
		case MULT:
			genSMC_MULMAT();
			break;
		case EQ:
			genSMC_EQMAT();
			break;
		default:
			printf("Error in smc");
			break;
		}
		break;
	default:
		printf("Error in smc");
		break;

	}
}

void genSMCAsm(t_tree node)
{
	genSMC_ASM(node->Node.Asm.Arg);
	genSMCCallNodeFunction(node->Node.Asm.Next);	
}
void genSMCIntConst(t_tree node)
{
	genSMC_PUSHINT(node->Node.IntConst.Value);
}
void genSMCBoolConst(t_tree node)
{
	genSMC_PUSHBOOL(node->Node.BoolConst.Value);
}
void genSMCFloatConst(t_tree node)
{
	genSMC_PUSHFLOAT(node->Node.FloatConst.Value);
}
void genSMCVecValue(t_tree node)
{
	int i;
	for (i = 0; i < 3; i++)
		genSMCCallNodeFunction(node->Node.VecValue.Values[i]);
	genSMC_PUSHVEC();
}
void genSMCMatValue(t_tree node)
{
	int i;
	for (i = 0; i < 9; i++)
		genSMCCallNodeFunction(node->Node.MatValue.Values[i]);
	genSMC_PUSHMAT();
}

void genSMCLValue(t_tree node)
{
	t_symtable * var_table = FindId(node->Node.LValue.Id,scope);
	if (var_table->type >= BOOL_ADDR)
	{
		genSMC_PUSHINT(var_table->offset);
		genSMC_PUSHFP();
		genSMC_ADDINT();
		genSMC_RVALINT();	
	}
	else
	{
		genSMC_PUSHINT(var_table->offset);
		genSMC_PUSHFP();
		genSMC_ADDINT();
	}
}

void genSMCRValue(t_tree node)
{
	t_symtable * var_table = FindId(node->Node.RValue.Id,scope);
	if (var_table->type < BOOL_ADDR)
	{
		genSMC_PUSHINT(var_table->offset);
		genSMC_PUSHFP();
		genSMC_ADDINT();
	}
	else
	{
		genSMC_PUSHINT(var_table->offset);
		genSMC_PUSHFP();
		genSMC_ADDINT();
		genSMC_RVALINT();		

	}
	switch(var_table->type)
	{
	case INT:
	case INT_ADDR:
		genSMC_RVALINT();
		break;
	case BOOL:
	case BOOL_ADDR:
		genSMC_RVALBOOL();
		break;
	case FLOAT:
	case FLOAT_ADDR:
		genSMC_RVALFLOAT();
		break;
	case VECTOR:
	case VECTOR_ADDR:
		genSMC_RVALVEC();
		break;
	case MATRIX:
	case MATRIX_ADDR:
		genSMC_RVALMAT();
		break;
	default:
		printf("Error building smc file.");
		break;		
	}
}

void genSMCCompValue(t_tree node)
{
	t_symtable * var_table = FindId(node->Node.CompValue.Id,scope);

	if (var_table->type < BOOL_ADDR)
	{
		genSMC_PUSHINT(var_table->offset);
		genSMC_PUSHFP();
		genSMC_ADDINT();	
	}
	else
	{
		genSMC_PUSHINT(var_table->offset);
		genSMC_PUSHFP();
		genSMC_ADDINT();	
		genSMC_RVALINT();		
	}	

	switch (var_table->type)
	{
	case VECTOR:
	case VECTOR_ADDR:
		genSMC_RVALVEC();
		genSMC_VECCOMP(node->Node.CompValue.iComp);
		break;
	case MATRIX:
	case MATRIX_ADDR:
		genSMC_RVALMAT();
		genSMC_PUSHFLOAT(node->Node.CompValue.iComp == 1 ? 1.0 : 0.0);
		genSMC_PUSHFLOAT(node->Node.CompValue.iComp == 2 ? 1.0 : 0.0);
		genSMC_PUSHFLOAT(node->Node.CompValue.iComp == 3 ? 1.0 : 0.0);
		genSMC_PUSHVEC();
		genSMC_MULMATVEC();
		break;
	default:
		printf("Error building smc.");
		break; 
	}
}


void generateSMC(t_tree node, t_symtable * globalScope, const char * filepath)
{
	scope = NULL;
	genSMCTabIndex = 0;
	genSMCLineNr = 1;

	genSMCFilePtr = fopen(filepath,"w");
	if (genSMCFilePtr != NULL)
	{
		scope = globalScope;
		genSMCCallNodeFunction(node);
		scope = scope->parent;
		fclose(genSMCFilePtr);
	}
	else
	{
		// error
		printf("\nError genSMC: Couldn't open file.\n");
	}
}
