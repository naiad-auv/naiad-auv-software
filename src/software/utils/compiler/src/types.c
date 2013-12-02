#include "symtab.h"
#include <stdlib.h>
#include <stdio.h>
#include "ast.h"
#include "types.h"

int typeErrorLineNr; // global to say what line number type error was found on


// AST functions
eType typeStmnt(t_tree node);
eType typeExpr(t_tree node);
eType typeProgram(t_tree node);
eType typeFunction(t_tree node);
eType typeFormal(t_tree node);
eType typeLocal(t_tree node);
eType typeAssign(t_tree node);
eType typeIf(t_tree node);
eType typeWhile(t_tree node);
eType typeLoop(t_tree node);
eType typeExit(t_tree node);
eType typeReturn(t_tree node);
eType typeFuncCallStmnt(t_tree node);
eType typeFuncCallExpr(t_tree node);
eType typeActual(t_tree node, t_symtable * func_table);
eType typeUnary(t_tree node);
eType typeBinary(t_tree node);
eType typeIntConst(t_tree node);
eType typeBoolConst(t_tree node);
eType typeFloatConst(t_tree node);
eType typeVecConst(t_tree node);
eType typeMatConst(t_tree node);
eType typeRValue(t_tree node);


eType typeStmnt(t_tree node)
{
	if (node == NULL)
		return VOID;

	switch(node->Kind)
	{		
	case kAssign:
		return typeAssign(node);
		break;
	case kIf:
		return typeIf(node);
		break;
	case kWhile:
		return typeWhile(node);
		break;
	case kRead:
		return typeRead(node);
		break;
	case kWrite:
		return typeWrite(node);
		break;
	case kFuncCallStmnt:
		return typeFuncCallStmnt(node);
		break;
	case kReturn:
		return typeReturn(node);
		break;
	default:
		printf("Error in types.c\n");
		break;
	}
}

eType typeExpr(t_tree node)
{
	switch(node->Kind)
	{
	case kUnary:
		return typeUnary(node);
		break;
	case kBinary:
		return typeBinary(node);
		break;
	case kIntConst:
		return typeIntConst(node);
		break;
	case kBoolConst:
		return typeBoolConst(node);
		break;
	case kStringConst:
		return typeStringConst(node);
		break;
	case kFuncCallExpr:
		return typeFuncCallExpr(node);
		break;
	case kRValue:
		return typeRValue(node);
		break;
	default:
		printf("Error in types.c!\n");
		break;
	}
}

eType typeProgram(t_tree node)
{
	return typeFunction(node->Node.Program.Functions);
}

eType typeFunction(t_tree node)
{
	if (node == NULL)
		return VOID;
	
	scope = FindId(node->Node.Function.Name, scope);
		
	if (typeStmnt(node->Node.Function.Stmnts) != VOID)
		return ERROR_TYPE;

	scope = scope->parent;
	return typeFunction(node->Node.Function.Next);
}

eType typeAssign(t_tree node)
{
	t_symtable * tmpTable;
	eType exprType;

	tmpTable = FindId(node->Node.Assign.Id, scope);
	exprType = tmpTable->type;

	if (exprType == typeExpr(node->Node.Assign.Expr))
		return typeStmnt(node->Node.Stmnt.Next);

	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;
}

eType typeIf(t_tree node)
{
	eType ifType, thenType, elseType, stmntType;
	ifType = typeExpr(node->Node.If.Expr);
	thenType = typeStmnt(node->Node.If.Then);
	elseType = node->Node.If.Else == NULL ? VOID : typeStmnt(node->Node.If.Else);
	stmntType = typeStmnt(node->Node.Stmnt.Next);

	if (ifType == BOOL && thenType == VOID && elseType == VOID && stmntType == VOID)
		return VOID;

	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;
}

eType typeWhile(t_tree node)
{
	if (typeExpr(node->Node.While.Expr) == BOOL &&
		typeStmnt(node->Node.While.Stmnt) == VOID &&
		typeStmnt(node->Node.Stmnt.Next) == VOID)
		return VOID;

	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;
}
eType typeRead(t_tree node)
{
	return typeStmnt(node->Node.Stmnt.Next);
}
eType typeWrite(t_tree node)
{
	node->Node.Write.Type = typeExpr(node->Node.Write.Expr);
	if (node->Node.Write.Type != ERROR_TYPE)
		return typeStmnt(node->Node.Stmnt.Next);
	return ERROR_TYPE;
}
eType typeReturn(t_tree node)
{
	eType exprType;

	exprType = typeExpr(node->Node.Return.Expr);
	if (exprType == scope->type)
		return VOID;

	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;	
	return ERROR_TYPE;	
}

eType typeFuncCallStmnt(t_tree node)
{
	t_symtable * table_iter;
	t_symtable * func_table;

	if (node == NULL)
		return VOID;

	// get symtable for function
	table_iter = scope;
	while (table_iter != NULL)
	{
		func_table = FindId(node->Node.FuncCallStmnt.FuncName, table_iter);
		if (func_table != NULL)
			break;
		table_iter = table_iter->parent;
	}

	if (typeActual(node->Node.FuncCallStmnt.Actuals, func_table) == VOID)
		return typeStmnt(node->Node.FuncCallStmnt.Next);

	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;
}

eType typeFuncCallExpr(t_tree node)
{
	t_symtable * table_iter;
	t_symtable * func_table;

	if (node == NULL)
		return VOID;

	// get symtable for function
	table_iter = scope;
	while (table_iter != NULL)
	{
		func_table = FindId(node->Node.FuncCallExpr.FuncName, table_iter);
		if (func_table != NULL)
			break;
		table_iter = table_iter->parent;
	}

	if (typeActual(node->Node.FuncCallExpr.Actuals, func_table) == VOID)
		return func_table->type;

	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;

}
eType typeActual(t_tree node, t_symtable * func_table)
{
	t_symtable * table_iter;

	if (node == NULL)
		return VOID;

	table_iter = func_table->child;
	while (table_iter != NULL)
	{
		if (table_iter->offset == node->Node.Actual.Number)
		{
			if (table_iter->type == typeExpr(node->Node.Actual.Expr))
				return typeActual(node->Node.Actual.Next, func_table);
			if (typeErrorLineNr < 0)
				typeErrorLineNr = node->LineNr;
			return ERROR_TYPE;
		}
		table_iter = table_iter->next;
	}

	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;
}

eType typeUnary(t_tree node)
{
	eType exprType = typeExpr(node->Node.Unary.Expr);
	if (node->Node.Unary.Operator == NEG)
	{
		if (exprType == INT)
		{
			node->Node.Unary.Type = exprType;
			return exprType;
		}
	}
	else if (exprType == BOOL)
	{
		node->Node.Unary.Type = exprType;
		return exprType;
	}

	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;

}
eType typeBinary(t_tree node)
{
	eType leftType = typeExpr(node->Node.Binary.LeftOperand);
	eType rightType = typeExpr(node->Node.Binary.RightOperand);
	
	if (leftType == rightType)
	{
		switch (node->Node.Binary.Operator)
		{
		case AND:
		case OR:
			if (leftType == BOOL)
			{
				node->Node.Binary.Type = BOOL;
				return BOOL;
			}
			break;
		case EQ:
			if (leftType != VOID)
			{
				node->Node.Binary.Type = leftType;
				return BOOL;
			}
			break;
		case LT:
		case LE:
			if (leftType != VOID && leftType != BOOL)
			{
				node->Node.Binary.Type = leftType;
				return BOOL;
			}
			break;
		default:
			if (leftType == INT)
			{
				node->Node.Binary.Type = leftType;
				return leftType;
			}
			break;		
		}
	}
	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;
}
eType typeIntConst(t_tree node)
{
	return INT;
}
eType typeBoolConst(t_tree node)
{
	return BOOL;
}
eType typeStringConst(t_tree node)
{
	return STRING;
}
eType typeRValue(t_tree node)
{
	t_symtable * tmpTable = FindId(node->Node.RValue.Id, scope);
	return tmpTable->type;
}

eType typeControl(t_tree node, t_symtable * globalScope)
{
	eType type;
	scope = NULL;
	scope = globalScope;
	typeErrorLineNr = -1;
	type = typeProgram(node);
	scope = scope->parent;
	return type;
}
