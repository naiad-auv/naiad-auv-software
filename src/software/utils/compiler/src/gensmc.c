#include "symtab.h"
#include <stdlib.h>
#include <stdio.h>
#include "ast.h"
#include "gensmc.h"

int genSMCLineNr; // keeps track of the current line number in the list file
int genSMCTabIndex;	// keeps track of the tabs
FILE * genSMCFilePtr;	// pointer to opened list file

// -----------------------------------------------------------------------------------

// helper functions
void genSMCInsertTab();
void genSMCRemoveTab();
void genSMCNewLine();

/*
      -- Jumps
      INSTR_BRF,	-- int
      INSTR_BRA,	-- int

      -- Subroutines
      INSTR_BSR,	-- int

      -- Memory deallocation
      INSTR_POP,	-- int

      -- Constants
      INSTR_PUSHINT,		-- PUSHINT 3
      INSTR_PUSHBOOL,		-- PUSHBOOL TRUE
      INSTR_PUSHFLOAT,		-- PUSHFLOAT 8.34
      INSTR_PUSHMAT,		-- PUSHMATRIX [[11.0,12.0,13.0],[21.0,22.0,23.0],[31.0,32.0,33.0]]
      INSTR_PUSHVEC,		-- PUSHVECTOR [1.0,2.0,3.0]

      -- Right value (variable values)
      INSTR_RVALINT,		-- int
      INSTR_RVALBOOL,		-- int
      INSTR_RVALFLOAT,		-- int
      INSTR_RVALMAT,		-- int
      INSTR_RVALVEC,		-- int

      -- Left value (variable addresses)
      INSTR_LVAL,		-- int

      -- Getters for vectors
      INSTR_VECCOMP,		-- int
*/


void genSMC_NULL();
void genSMC_MAIN();

void genSMC_LINK();
void genSMC_UNLINK();

void genSMC_BRF(int iAddress);
void genSMC_BRA(int iAddress);

void genSMC_BSR(); // (int iAddress); Comment: Now pops address from stack instead
void genSMC_RTS();

void genSMC_DECL();
void genSMC_DECLINT();
void genSMC_DECLBOOL();
void genSMC_DECLFLOAT();
void genSMC_DECLMAT();
void genSMC_DECLVEC();

void genSMC_POP(int iAmount);

void genSMC_PUSHINT(int iValue);
void genSMC_PUSHBOOL(const char * pValue);
void genSMC_PUSHFLOAT(float fValue);
void genSMC_PUSHMAT(float fMatrix[9]);
void genSMC_PUSHVEC(float fVector[3]);


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
void genSMC_MULINT();

void genSMC_NEGFLOAT();
void genSMC_ADDFLOAT();
void genSMC_MULFLOAT();

void genSMC_NEGVEC();
void genSMC_ADDVEC();
void genSMC_MULVEC();

void genSMC_VECCOMP(int iComponent);

void genSMC_MULMAT();

void genSMC_SIN();
void genSMC_COS();
void genSMC_ARCSIN();
void genSMC_ARCCOS();

void genSMC_ITOF();
void genSMC_FTOI();


void genSMC_FunctionBegin();
void genSMC_FunctionEnd();

// AST functions
void genSMCCallNodeFunction(t_tree node);
void genSMCVariable(t_tree node);
void genSMCProgram(t_tree node);
void genSMCFunction(t_tree node);
void genSMCFormal(t_tree node);
void genSMCLocal(t_tree node);
void genSMCAssign(t_tree node);
void genSMCIf(t_tree node);
void genSMCWhile(t_tree node);
void genSMCReturn(t_tree node);
void genSMCFuncCallStmnt(t_tree node);
void genSMCFuncCallExpr(t_tree node);
void genSMCActual(t_tree node);
void genSMCUnary(t_tree node);
void genSMCBinary(t_tree node);
void genSMCIntConst(t_tree node);
void genSMCBoolConst(t_tree node);
void genSMCRValue(t_tree node);
void genSMCLValue(t_tree node);


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
/*
void genSMC_LINK()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LINK");
}
void genSMC_UNLINK()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "UNLINK");
}*/

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

/*
void genSMC_BRF(int address)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "BRF %d", address);
}
void genSMC_BRA(int address)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "BRA %d", address);
}
*/
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

/*
void genSMC_BSR(int address)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "BSR %d", address);
}
*/

void genSMC_BSR() // (int iAddress); Comment: Now pops address from stack instead
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "BSR");	
}

/*
void genSMC_RTS()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RTS");
}
*/
void genSMC_RTS()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RTS");
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
	case POINTER:
	case BOOL_ADDR:
	case INT_ADDR:
	case FLOAT_ADDR:
	case VECTOR_ADDR:
	case MATRIX_ADDR:
	case POINTER_ADDR:
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


void genSMC_POP(int iAmount)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "POP %d", iAmount);
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
void genSMC_PUSHMAT(float fMatrix[9])
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHMAT [[%f,%f,%f], [%f,%f,%f], [%f,%f,%f]]", 
				fMatrix[0], fMatrix[1], fMatrix[2],
 				fMatrix[3], fMatrix[4], fMatrix[5], 
				fMatrix[6], fMatrix[7], fMatrix[8] );
}
void genSMC_PUSHVEC(float fVector[3])
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHVEC [%f,%f,%f]", fVector[0], fVector[1], fVector[2]);
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
	genSMC_RTS();
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
	case kFuncCallExpr:
		genSMCFuncCallExpr(node);
		break;
	case kLValue:
		genSMCLValue(node);
		break;
	case kRValue:
		genSMCRValue(node);
		break;
	default:
		printf("What?\n");
		break;
	}
}

void genSMCProgram(t_tree node)
{
	genSMCCallNodeFunction(node->Node.Program.Functions);
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

	genSMC_FunctionEnd();
	scope = scope->parent;

	// go to next func
	genSMCCallNodeFunction(node->Node.Function.Next);
}


void genSMCAssign(t_tree node)
{
	t_symtable * var_table = FindId(node->Node.Assign.Id,scope);
	eType type = var_table->type;

	if (type > 6 && type < 13)
		genSMC_RVALINT(var_table->offset);
	else
		genSMC_LVAL(var_table->offset);

	genSMCCallNodeFunction(node->Node.Assign.Expr);
	
	switch(var_table->type)
	{
	case INT:
	case INT_ADDR:
	case POINTER:
	case POINTER_ADDR:
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
		genSMC_LVAL(retValOffset);
		genSMCCallNodeFunction(node->Node.Return.Expr);
		switch (scope->type)
		{
		case POINTER:
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
	genSMC_UNLINK();
	genSMC_RTS();
	genSMCCallNodeFunction(node->Node.Return.Next);
}

void genSMCFuncCallStmnt(t_tree node)
{
	t_symtable * func_table;
	t_symtable * table_iter;
	t_tree actual_iter;
	
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
	
	actual_iter = node->Node.FuncCallStmnt.Actuals;
	while (actual_iter != NULL)
	{
		genSMCActual(actual_iter->Node.Actual.Expr);
		actual_iter = actual_iter->Node.Actual.Next;
	}

	genSMC_BSR(func_table->offset);

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

	genSMC_BSR(func_table->offset);

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
}
void genSMCActual(t_tree node)
{
	// opposite order here to keep the offsets correct
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
	default:
		printf("ERror in smc file.");
		break;
	}
}

// type in Binary node is set in type analysis pass.
// the type of a Binary node will be equal to the type of both operands
void genSMCBinary(t_tree node)
{
	genSMCCallNodeFunction(node->Node.Binary.LeftOperand);
	genSMCCallNodeFunction(node->Node.Binary.RightOperand);
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
		}
		break;
	case INT:
		switch (node->Node.Binary.Operator)
		{
		case PLUS:
			genSMC_ADD();
			break;
		case SUB:
			genSMC_SUB();
			break;
		case DIV:
			genSMC_DIV();
			break;
		case MULT:
			genSMC_MULT();
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
		}
		break;
/*
	case STRING:
		switch (node->Node.Binary.Operator)
		{
		case EQ:
			genSMC_EQSTRING();
			break;
		case LT:
			genSMC_LTSTRING();
			break;
		case LE:
			genSMC_LESTRING();
			break;
		}
		break;
*/
	}
}
void genSMCIntConst(t_tree node)
{
	genSMC_PUSHINT(node->Node.IntConst.Value);
}
void genSMCBoolConst(t_tree node)
{
	genSMC_PUSHBOOL(node->Node.BoolConst.Value);
}

void genSMCLValue(t_tree node)
{
	t_symtable * var_table = FindId(node->Node.RValue.Id,scope);
	genSMC_PUSHINT(var_table->offset);
}

void genSMCRValue(t_tree node)
{
	t_symtable * var_table = FindId(node->Node.RValue.Id,scope);
	if (var_table->type < BOOL_ADDR)
		genSMC_PUSHINT(var_table->offset);
	else
	{
		genSMC_PUSHINT(var_table->offset);
		genSMC_RVALINT();		
	}
	switch(var_table->type)
	{
	case INT:
	case INT_ADDR:
	case POINTER:
	case POINTER_ADDR:
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
