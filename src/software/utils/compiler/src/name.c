#include "name.h"
#include "symtab.h"
#include <stdlib.h>
#include <stdio.h>



int nameErrorType;
int nameErrorLineNr;
const char * nameErrorId;

// helper functions
void checkIdExists(const char * name, int lineNr, int type, int funcorvar);
void checkIdUndefined(const char * name, int lineNr);

// AST functions
t_symtable *nameProgram(t_tree node);
void nameExpr(t_tree node);
void nameStmnt(t_tree node);
void nameVariable(t_tree node);
void nameFunction(t_tree node);
void nameFormal(t_tree node);
void nameLocal(t_tree node);
void nameAssign(t_tree node);
void nameIf(t_tree node);
void nameWhile(t_tree node);
void nameLoop(t_tree node);
void nameExit(t_tree node);
void nameReturn(t_tree node);
void nameFuncCallStmnt(t_tree node);
void nameFuncCallExpr(t_tree node);
void nameActual(t_tree node, int number);
void nameUnary(t_tree node);
void nameBinary(t_tree node);
void nameRValue(t_tree node);

void nameExpr(t_tree node)
{
	switch(node->Kind)
	{
	case kUnary:
		nameUnary(node);
		break;
	case kBinary:
		nameBinary(node);
		break;
	case kIntConst:
	case kBoolConst:
	case kFloatConst:
	case kVecConst:
	case kMatConst:
		return;
	case kFuncCallExpr:
		nameFuncCallExpr(node);
		break;
	case kRValue:
		nameRValue(node);
		break;
	default:
		printf("Error in name.c!\n");
		break;
	}
}

void nameStmnt(t_tree node)
{
	if (node == NULL)
		return;

	switch(node->Kind)
	{
	case kAssign:
		nameAssign(node);
		break;
	case kIf:
		nameIf(node);
		break;
	case kWhile:
		nameWhile(node);
		break;
	case kFuncCallStmnt:
		nameFuncCallStmnt(node);
		break;
	case kReturn:
		nameReturn(node);
		break;
	case kLoop:
		nameLoop(node);
		break;
	case kExit:
		nameExit(node);
		break;
	default:
		printf("Error in name.c!\n");
		break;
	}
}

void checkIdExists(const char * name, int lineNr, int type, int funcorvar)
{
	t_symtable * table_iter = scope;
	t_symtable * tableFound = NULL;
	while (table_iter != NULL)
	{
		tableFound = FindId(name, table_iter);
		if (tableFound != NULL && nameErrorType <= 0)
		{
			nameErrorType = NAME_ERROR_TYPE_ALREADY_DEFINED;
			nameErrorLineNr = lineNr;
			nameErrorId = name;
			return;
		}
		table_iter = table_iter->parent;
	}
	// om det inte finns, lägg till det
	if (funcorvar == 0)
		createFunctionTable(name,type);
	else
		createVariableTable(name,type);
}

void checkIdUndefined(const char * name, int lineNr)
{
	t_symtable * table_iter = scope;
	t_symtable * tableFound = NULL;
	if (nameErrorType > 0)
		return;
	while (table_iter != NULL)
	{
		tableFound = FindId(name, table_iter);
		if (tableFound != NULL)
			return;
		table_iter = table_iter->parent;
	}
	nameErrorType = NAME_ERROR_TYPE_NOT_DEFINED;
	nameErrorLineNr = lineNr;
	nameErrorId = name;
}

t_symtable *nameProgram(t_tree node)
{
	scope = createFunctionTable(NULL, 0); // create "empty" function symbol table to use as global scope
	nameFunction(node->Node.Program.Functions);
	return scope; // return the global scope
}
void nameFunction(t_tree node)
{
	if (node == NULL)
		return;
	
	checkIdExists(node->Node.Function.Name, node->LineNr, node->Node.Function.Type, NAME_TABLE_FUNCTION);
	scope = FindId(node->Node.Function.Name, scope);
		
	nameVariable(node->Node.Function.Variables);

	nameStmnt(node->Node.Function.Stmnts);

	scope = scope->parent;
	nameFunction(node->Node.Function.Next);
}

void nameVariable(t_tree node)
{
	if (node == NULL)
		return;
	if (node->Node.Variable.VarKind == kFormal)
		nameFormal(node);
	else
		nameLocal(node);
	nameVariable(node->Node.Variable.Next);
}

void nameLocal(t_tree node)
{
	checkIdExists(node->Node.Variable.Name, node->LineNr, node->Node.Variable.Type, NAME_TABLE_VARIABLE);
}
void nameFormal(t_tree node)
{
	int offset = 0;
	t_symtable *thisVar;
	t_symtable *var_iter;

	checkIdExists(node->Node.Variable.Name, node->LineNr, node->Node.Variable.Type, NAME_TABLE_VARIABLE);
	thisVar = FindId(node->Node.Variable.Name,scope);
	var_iter = thisVar->parent->child;

	// this sets the order of the formal vars so we know which Actual 
	// to match up with the right Formal when performing type control.
	while (var_iter != NULL)
	{
		if (var_iter->offset > offset)
			offset = var_iter->offset;
		var_iter = var_iter->next;
	}
	thisVar->offset = offset + 1;
}
void nameAssign(t_tree node)
{
	checkIdUndefined(node->Node.Assign.Id, node->LineNr);

	nameExpr(node->Node.Assign.Expr);

	nameStmnt(node->Node.Stmnt.Next);
}
void nameIf(t_tree node)
{
	nameExpr(node->Node.If.Expr);

	nameStmnt(node->Node.If.Then);

	if (node->Node.If.Else != NULL)
		nameStmnt(node->Node.If.Else);
	
	nameStmnt(node->Node.Stmnt.Next);
}
void nameWhile(t_tree node)
{
	nameExpr(node->Node.While.Expr);

	nameStmnt(node->Node.While.Stmnt);

	nameStmnt(node->Node.Stmnt.Next);
}
void nameLoop(t_tree node)
{
	nameStmnt(node->Node.Loop.Stmnt);

	nameStmnt(node->Node.Stmnt.Next);
}
void nameExit(t_tree node)
{
	nameStmnt(node->Node.Stmnt.Next);
}
void nameReturn(t_tree node)
{
	if (node->Node.Return.Expr != NULL)
		nameExpr(node->Node.Return.Expr);

	nameStmnt(node->Node.Stmnt.Next);
}
void nameFuncCallStmnt(t_tree node)
{
	checkIdUndefined(node->Node.FuncCallStmnt.FuncName, node->LineNr);
	nameActual(node->Node.FuncCallStmnt.Actuals, 1);
	
	nameStmnt(node->Node.Stmnt.Next);
}
void nameFuncCallExpr(t_tree node)
{
	checkIdUndefined(node->Node.FuncCallExpr.FuncName, node->LineNr);
	nameActual(node->Node.FuncCallExpr.Actuals, 1);
}
void nameActual(t_tree node, int number)
{
	if (node == NULL)
		return;

	// this sets up the order of the actuals so we know
	// which Actual to match up with which Formal.
	node->Node.Actual.Number = number;

	nameExpr(node->Node.Actual.Expr);
	nameActual(node->Node.Actual.Next, number + 1);
}
void nameUnary(t_tree node)
{
	nameExpr(node->Node.Unary.Expr);
}
void nameBinary(t_tree node)
{
	nameExpr(node->Node.Binary.LeftOperand);
	nameExpr(node->Node.Binary.RightOperand);
}
void nameRValue(t_tree node)
{
	checkIdUndefined(node->Node.RValue.Id, node->LineNr);
}


t_symtable *nameAnalysis(t_tree node)
{
	scope = NULL;
	nameErrorType = 0;
	return nameProgram(node);
}
