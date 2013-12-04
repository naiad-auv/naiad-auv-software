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

void genSMC_BSR(int iAddress);
void genSMC_RTS();

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

void genSMC_RVALINT(int iAddress);
void genSMC_RVALBOOL(int iAddress);
void genSMC_RVALFLOAT(int iAddress);
void genSMC_RVALMAT(int iAddress);
void genSMC_RVALVEC(int iAddress);

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


// SMC file writing functions
void genSMC_LINK();
void genSMC_UNLINK();
void genSMC_RTS();
int genSMC_DECL(eType type);
void genSMC_ASSINT();
void genSMC_ASSBOOL();
void genSMC_ASSSTRING();
void genSMC_RVALINT(int offset);
void genSMC_RVALBOOL(int offset);
void genSMC_RVALSTRING(int offset);
void genSMC_PUSHINT(int value);
void genSMC_PUSHBOOL(int value);
void genSMC_PUSHSTRING(const char * value);
void genSMC_LVAL(int offset);
void genSMC_OR();
void genSMC_AND();
void genSMC_EQBOOL();
void genSMC_ADD();
void genSMC_SUB();
void genSMC_DIV();
void genSMC_MULT();
void genSMC_EQINT();
void genSMC_LTINT();
void genSMC_LEINT();
void genSMC_EQSTRING();
void genSMC_LTSTRING();
void genSMC_LESTRING();
void genSMC_NOT();
void genSMC_NEG();
void genSMC_WRITEBOOL();
void genSMC_WRITEINT();
void genSMC_WRITESTRING();
void genSMC_READBOOL();
void genSMC_READINT();
void genSMC_READSTRING();
void genSMC_BSR(int address);
void genSMC_BRF(int address);
void genSMC_BRA(int address);
void genSMC_POP(eType type);
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
void genSMCRead(t_tree node);
void genSMCWrite(t_tree node);
void genSMCReturn(t_tree node);
void genSMCFuncCallStmnt(t_tree node);
void genSMCFuncCallExpr(t_tree node);
void genSMCActual(t_tree node);
void genSMCUnary(t_tree node);
void genSMCBinary(t_tree node);
void genSMCIntConst(t_tree node);
void genSMCBoolConst(t_tree node);
void genSMCStringConst(t_tree node);
void genSMCRValue(t_tree node);


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
void genSMC_RTS()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RTS");
}
int genSMC_DECL(eType type)
{
	int size;
	switch (type)
	{
	case INT:
	case BOOL:
		size = 1;
		break;
	case VOID:
		return 0;
	case STRING:
		size = 100;
		break;
	}
	genSMCNewLine();
	fprintf(genSMCFilePtr, "DECL %d", size);
	return size;
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
void genSMC_ASSSTRING()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ASSSTRING");
}

void genSMC_RVALINT(int offset)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RVALINT %d(FP)", offset);
}
void genSMC_RVALBOOL(int offset)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RVALBOOL %d(FP)", offset);
}
void genSMC_RVALSTRING(int offset)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "RVALSTRING %d(FP)", offset);
}
void genSMC_PUSHSTRING(const char * value)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHSTRING ");
	fprintf(genSMCFilePtr, value);
}
void genSMC_PUSHINT(int value)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "PUSHINT %d", value);
}
void genSMC_PUSHBOOL(int value)
{
	genSMCNewLine();
	if (value == 1)
		fprintf(genSMCFilePtr, "PUSHBOOL true", value);
	else
		fprintf(genSMCFilePtr, "PUSHBOOL false", value);
}

void genSMC_LVAL(int offset)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LVAL %d(FP)", offset);
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

void genSMC_ADD()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "ADD");
}
void genSMC_SUB()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "SUB");
}
void genSMC_DIV()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "DIV");
}
void genSMC_MULT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "MULT");
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
void genSMC_EQSTRING()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "EQSTRING");
}
void genSMC_LTSTRING()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LTSTRING");
}
void genSMC_LESTRING()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "LESTRING");
}
void genSMC_NOT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "NOT");
}
void genSMC_NEG()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "NEG");
}
void genSMC_WRITEBOOL()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "WRITEBOOL");
}
void genSMC_WRITEINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "WRITEINT");
}
void genSMC_WRITESTRING()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "WRITESTRING");
}
void genSMC_READBOOL()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "READBOOL");
}
void genSMC_READINT()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "READINT");
}
void genSMC_READSTRING()
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "READSTRING");
}
void genSMC_BSR(int address)
{
	genSMCNewLine();
	fprintf(genSMCFilePtr, "BSR %d", address);
}
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
void genSMC_POP(eType type)
{
	int size;
	switch (type)
	{
	case INT:
	case BOOL:
		size = 1;
		break;
	case VOID:
		return;
	case STRING:
		size = 100;
		break;
	}
	genSMCNewLine();
	fprintf(genSMCFilePtr, "POP %d", size);
}


void genSMC_FunctionBegin()
{
	genSMCNewLine();

	scope->offset = genSMCLineNr; // spar rad offset för funktionen så man kan kalla på den
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
	case kRead:
		genSMCRead(node);
		break;
	case kWrite:
		genSMCWrite(node);
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
	case kStringConst:
		genSMCStringConst(node);
		break;
	case kFuncCallExpr:
		genSMCFuncCallExpr(node);
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
	int offset;
	t_symtable * var_table;

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
			var_table = FindId(var_iter->Node.Variable.Name, scope);
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

	genSMC_LVAL(var_table->offset);
	genSMCCallNodeFunction(node->Node.Assign.Expr);
	
	switch(var_table->type)
	{
	case INT:
		genSMC_ASSINT();
		break;
	case BOOL:
		genSMC_ASSBOOL();
		break;
	case STRING:
		genSMC_ASSSTRING();
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
void genSMCRead(t_tree node)
{
	t_symtable * var_table = FindId(node->Node.Read.Id,scope);
	genSMC_LVAL(var_table->offset);
	switch(var_table->type)
	{
	case BOOL:
		genSMC_READBOOL();
		genSMC_ASSBOOL();
		break;
	case INT:
		genSMC_READINT();
		genSMC_ASSINT();
		break;
	case STRING:
		genSMC_READSTRING();
		genSMC_ASSSTRING();
		break;
	}
	
	genSMCCallNodeFunction(node->Node.Read.Next);
}
void genSMCWrite(t_tree node)
{
	genSMCCallNodeFunction(node->Node.Write.Expr);
	switch(node->Node.Write.Type)
	{
	case BOOL:
		genSMC_WRITEBOOL();
		break;
	case INT:
		genSMC_WRITEINT();
		break;
	case STRING:
		genSMC_WRITESTRING();
		break;
	}
	genSMC_POP(node->Node.Write.Type);
	genSMCCallNodeFunction(node->Node.Write.Next);
}
void genSMCReturn(t_tree node)
{
	int retValOffset;
	int size;
	t_symtable * var_iter;
	
	// figure out the offset of the return value address
	retValOffset = 2;
	var_iter = scope->child;
	while (var_iter != NULL)
	{
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
		if (var_iter->offset > 0 && var_iter->offset + size > retValOffset)
			retValOffset = var_iter->offset + size;
		var_iter = var_iter->next;
	}


	if (scope->type != VOID)
	{
		genSMC_LVAL(retValOffset);
		genSMCCallNodeFunction(node->Node.Return.Expr);
		switch (scope->type)
		{
		case INT:
			genSMC_ASSINT();
			break;
		case BOOL:
			genSMC_ASSBOOL();
			break;
		case STRING:
			genSMC_ASSSTRING();
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
	t_tree actual_iter;
	
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
		genSMC_NEG();
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
void genSMCStringConst(t_tree node)
{
	genSMC_PUSHSTRING(node->Node.StringConst.Value);
}
void genSMCRValue(t_tree node)
{
	t_symtable * var_table = FindId(node->Node.RValue.Id,scope);
	switch(var_table->type)
	{
	case INT:
		genSMC_RVALINT(var_table->offset);
		break;
	case BOOL:
		genSMC_RVALBOOL(var_table->offset);
		break;
	case STRING:
		genSMC_RVALSTRING(var_table->offset);
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
