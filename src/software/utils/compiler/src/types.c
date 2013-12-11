/* FILE:       types.c
   CONTENTS:   types.c - This is the type analysis of NaiAda compiler
   AUTHOR:     Per-Erik Måhl
*/

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
eType typeAsm(t_tree node);
eType typeReturn(t_tree node);
eType typeFuncCallStmnt(t_tree node);
eType typeFuncCallExpr(t_tree node);
eType typeActual(t_tree node, t_symtable * func_table);
eType typeUnary(t_tree node);
eType typeBinary(t_tree node);
eType typeIntConst(t_tree node);
eType typeBoolConst(t_tree node);
eType typeFloatConst(t_tree node);
eType typeVecValue(t_tree node);
eType typeMatValue(t_tree node);
eType typeRValue(t_tree node);
eType typeLValue(t_tree node);
eType typeCompValue(t_tree node);


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
	case kLoop:
		return typeLoop(node);
		break;
	case kExit:
		return typeExit(node);
		break;
	case kAsm:
		return typeAsm(node);
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
	return ERROR_TYPE;
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
	case kFloatConst:
		return typeFloatConst(node);
		break;
	case kVecValue:
		return typeVecValue(node);
		break;
	case kMatValue:
		return typeMatValue(node);
		break;
	case kFuncCallExpr:
		return typeFuncCallExpr(node);
		break;
	case kLValue:
		return typeLValue(node);
		break;
	case kRValue:
		return typeRValue(node);
		break;
	case kCompValue:
		return typeCompValue(node);
		break;
	default:
		printf("Error in types.c!\n");
		break;
	}
	return ERROR_TYPE;
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

	if (exprType > MATRIX && exprType < ERROR_TYPE)
		exprType -= MATRIX;

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
eType typeLoop(t_tree node)
{
	if (typeStmnt(node->Node.Loop.Stmnt) == VOID)
		return typeStmnt(node->Node.Stmnt.Next);
	return ERROR_TYPE;
}
eType typeAsm(t_tree node)
{
	return typeStmnt(node->Node.Stmnt.Next);
}
eType typeExit(t_tree node)
{
	return typeStmnt(node->Node.Stmnt.Next);
}
eType typeReturn(t_tree node)
{
	eType exprType;

	if (node->Node.Return.Expr == NULL)
		exprType = VOID;
	else
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

	switch (node->Node.Unary.Operator)
	{
	case NEG:
		if (exprType == INT)
		{
			node->Node.Unary.Type = exprType;
			return exprType;
		}
		if (exprType == FLOAT)
		{
			node->Node.Unary.Type = exprType;
			return exprType;
		}
		if (exprType == VECTOR)
		{
			node->Node.Unary.Type = exprType;
			return exprType;
		}
		break;

	case INTOP:
		if (exprType == FLOAT)
		{
			node->Node.Unary.Type = INT;
			return INT;
		}
		break;
	case FLOATOP:
		if (exprType == INT)
		{
			node->Node.Unary.Type = FLOAT;
			return FLOAT;
		}
		break;
	case SIN:
		if (exprType == FLOAT)
		{
			node->Node.Unary.Type = FLOAT;
			return FLOAT;
		}
		break;
	case COS:
		if (exprType == FLOAT)
		{
			node->Node.Unary.Type = FLOAT;
			return FLOAT;
		}
		break;
	case ASIN:
		if (exprType == FLOAT)
		{
			node->Node.Unary.Type = FLOAT;
			return FLOAT;
		}
		break;
	case ACOS:
		if (exprType == FLOAT)
		{
			node->Node.Unary.Type = FLOAT;
			return FLOAT;
		}
		break;
	case ABS:
		if (exprType == FLOAT || exprType == INT)
		{
			node->Node.Unary.Type = exprType;
			return exprType;
		}
		break;
	case SQRT:
		if (exprType == FLOAT)
		{
			node->Node.Unary.Type = FLOAT;
			return FLOAT;
		}
		break;
	default:
		if (exprType == BOOL)
		{
			node->Node.Unary.Type = exprType;
			return exprType;
		}
		break;
	}


	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;

}
eType typeBinary(t_tree node)
{
	eType leftType = typeExpr(node->Node.Binary.LeftOperand);
	eType rightType = typeExpr(node->Node.Binary.RightOperand);

	node->Node.Binary.LeftType = leftType;
	node->Node.Binary.RightType = rightType;
	
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
		case MT:
		case ME:
			if (leftType == INT || leftType == FLOAT)
			{
				node->Node.Binary.Type = leftType;
				return BOOL;
			}
			break;
		default:
			if (leftType == INT || leftType == MATRIX || leftType == VECTOR || leftType == FLOAT)
			{
				node->Node.Binary.Type = leftType;
				return leftType;
			}
			break;		
		}
	}
	else
	{
		if ((leftType == MATRIX && rightType == VECTOR) || (leftType == VECTOR && rightType == MATRIX))
		{
			node->Node.Binary.Type = VECTOR;
			return VECTOR;
		}
		else if ((leftType == VECTOR && rightType == FLOAT) || (leftType == FLOAT && rightType == VECTOR))
		{
			node->Node.Binary.Type = VECTOR;	
			return VECTOR;
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
eType typeFloatConst(t_tree node)
{
	return FLOAT;
}
eType typeVecValue(t_tree node)
{
	int i;
	for (i = 0; i < 3; i++)
	{
		if (typeExpr(node->Node.VecValue.Values[i]) != FLOAT)
		{
			if (typeErrorLineNr < 0)
				typeErrorLineNr = node->LineNr;
			return ERROR_TYPE;
		}
	}
	return VECTOR;
}
eType typeMatValue(t_tree node)
{
	int i;
	for (i = 0; i < 9; i++)
	{
		if (typeExpr(node->Node.MatValue.Values[i]) != FLOAT)
		{
			if (typeErrorLineNr < 0)
				typeErrorLineNr = node->LineNr;
			return ERROR_TYPE;
		}
	}
	return MATRIX;
}
eType typeRValue(t_tree node)
{
	eType type;

	t_symtable * tmpTable = FindId(node->Node.RValue.Id, scope);
	type = tmpTable->type;

	if (type > MATRIX && type != ERROR_TYPE)
		type -= MATRIX;
	return type;
}
eType typeLValue(t_tree node)
{
	t_symtable * tmpTable = FindId(node->Node.LValue.Id, scope);
	if (tmpTable->type > MATRIX)
		return tmpTable->type;
	return tmpTable->type + MATRIX;
}

eType typeCompValue(t_tree node)
{
	t_symtable * tmpTable = FindId(node->Node.CompValue.Id, scope);
	if (tmpTable->type == node->Node.CompValue.type || tmpTable->type - MATRIX == node->Node.CompValue.type)
	{
		if (tmpTable->type == VECTOR || tmpTable->type == VECTOR_ADDR)
			return FLOAT;
		if (tmpTable->type == MATRIX || tmpTable->type == MATRIX_ADDR)
			return VECTOR;
	}

	if (typeErrorLineNr < 0)
		typeErrorLineNr = node->LineNr;
	return ERROR_TYPE;
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
