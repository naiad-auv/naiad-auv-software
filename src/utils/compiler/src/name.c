/* FILE:       name.c
   CONTENTS:   name.c - This performs name analysis for NaiAda compiler
   AUTHOR:     Per-Erik Måhl
*/

#include "name.h"
#include "symtab.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>



int nameErrorType;
int nameErrorLineNr;
const char * nameErrorId;
t_tree nameCurrentPrimitive;

// helper functions
void replaceString(char ** replace, const char * with);
void joinStrings(char ** target, const char * first, const char * second);
void checkIdExists(const char * name, int lineNr, int type, int funcorvar);
void checkIdUndefined(const char * name, int lineNr);
void checkIdUndefinedInPrimitive(char ** name, int lineNr);

// AST functions
t_symtable *nameProgram(t_tree node);
void namePrimitive(t_tree node);
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
void nameAsm(t_tree node);
void nameLabel(t_tree node);
void nameReturn(t_tree node);
void nameFuncCallStmnt(t_tree node);
void nameFuncCallExpr(t_tree node);
void nameActual(t_tree node, int number);
void nameUnary(t_tree node);
void nameBinary(t_tree node);
void nameVecValue(t_tree node);
void nameMatValue(t_tree node);
void nameRValue(t_tree node);
void nameLValue(t_tree node);
void nameCompValue(t_tree node);
void nameGoto(t_tree node);

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
		return;
	case kVecValue:
		nameVecValue(node);
		break;
	case kMatValue:
		nameMatValue(node);
		break;
	case kFuncCallExpr:
		nameFuncCallExpr(node);
		break;
	case kRValue:
		nameRValue(node);
		break;
	case kLValue:
		nameRValue(node);
		break;
	case kCompValue:
		nameCompValue(node);
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
	case kAsm:
		nameAsm(node);
		break;
	case kLabel:
		nameLabel(node);
		break;
	case kGoto:
		nameGoto(node);
		break;
	default:
		printf("Error in name.c!\n");
		break;
	}
}

void replaceString(char ** replace, const char * with)
{
	char * with_cpy = (char *)malloc(sizeof(char) * (strlen(with) + 1));
	strcpy(with_cpy, with);
	with_cpy[strlen(with)] = 0;

	free(*replace);
	*replace = (char *)malloc(sizeof(char) * (strlen(with_cpy) + 1));
	strcpy(*replace, with_cpy);
	(*replace)[strlen(with_cpy)] = 0;
	
	free(with_cpy);
}

void joinStrings(char ** target, const char * first, const char * second)
{
	char * first_cpy = (char *)malloc(sizeof(char) * (strlen(first) + 1));
	char * second_cpy = (char *)malloc(sizeof(char) * (strlen(first) + 1));
	strcpy(first_cpy, first);
	strcpy(second_cpy, second);
	first_cpy[strlen(first)] = 0;
	second_cpy[strlen(second)] = 0;

	free(*target);
	*target = (char *)malloc(sizeof(char) * (strlen(first_cpy) + strlen(second_cpy) + 1));
	strcpy(*target, first_cpy);
	strcat(*target, second_cpy);
	(*target)[strlen(first_cpy) + strlen(second_cpy)] = 0;	

	free(first_cpy);
	free(second_cpy);
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

void checkIdUndefinedInPrimitive(char ** name, int lineNr)
{
	t_symtable * table_iter = scope;
	t_symtable * tableFound = NULL;
	char * new_name;

	if (nameErrorType > 0)
		return;

	while (table_iter != NULL)
	{
		tableFound = FindId(*name, table_iter);
		if (tableFound != NULL)
			return;
		table_iter = table_iter->parent;
	}

	new_name = (char *)malloc(sizeof(char) * (strlen(*name) + strlen(nameCurrentPrimitive->Node.Primitive.Name) + 1));
	strcpy(new_name, nameCurrentPrimitive->Node.Primitive.Name);
	strcat(new_name, *name);
	new_name[strlen(*name) + strlen(nameCurrentPrimitive->Node.Primitive.Name)] = 0;
	
	table_iter = scope;
	while (table_iter != NULL)
	{
		tableFound = FindId(new_name, table_iter);
		if (tableFound != NULL)
		{
			free(*name);
			(*name) = new_name;
			return;
		}
		table_iter = table_iter->parent;
	}
	free(new_name);
	nameErrorType = NAME_ERROR_TYPE_NOT_DEFINED;
	nameErrorLineNr = lineNr;
	nameErrorId = *name;		
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
	namePrimitive(node->Node.Program.CompUnits);
	return scope; // return the global scope
}

void namePrimitive(t_tree node)
{
	if (node == NULL)
		return;

	if (node->Kind == kFunction)
		nameFunction(node);
	else
	{
		nameCurrentPrimitive = node;
		nameFunction(node->Node.Primitive.Functions);

		nameCurrentPrimitive = NULL;
		namePrimitive(node->Node.Primitive.Next);
	}
}

void namePrimitiveVariables(t_tree node)
{
	if (node == NULL)
		return;
	
	if (node->Node.Variable.VarKind == kFormal && node->Node.Variable.Type < BOOL_ADDR)
		node->Node.Variable.Type += MATRIX;
	node->Node.Variable.VarKind = kFormal;
	
	namePrimitiveVariables(node->Node.Variable.Next);
}

void nameFunction(t_tree node)
{
	if (node == NULL)
		return;

	if (nameCurrentPrimitive != NULL)
	{
		if (strcmp(node->Node.Function.Name, "main") == 0)
		{
			replaceString(&node->Node.Function.Name, nameCurrentPrimitive->Node.Primitive.Name);
			node->Node.Function.Variables = nameCurrentPrimitive->Node.Primitive.Variables;
			nameCurrentPrimitive->Node.Primitive.Variables = NULL;
			namePrimitiveVariables(node->Node.Function.Variables);
		}
		else
			joinStrings(&node->Node.Function.Name, nameCurrentPrimitive->Node.Primitive.Name, node->Node.Function.Name);			
	}
	
	checkIdExists(node->Node.Function.Name, node->LineNr, node->Node.Function.Type, NAME_TABLE_FUNCTION);
	scope = FindId(node->Node.Function.Name, scope);
		
	nameVariable(node->Node.Function.Variables);

	nameStmnt(node->Node.Function.Stmnts);

	scope = scope->parent;
	namePrimitive(node->Node.Function.Next);
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
void nameAsm(t_tree node)
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
	if (nameCurrentPrimitive == NULL)
		checkIdUndefined(node->Node.FuncCallStmnt.FuncName, node->LineNr);
	else
		checkIdUndefinedInPrimitive(&node->Node.FuncCallStmnt.FuncName, node->LineNr);

	nameActual(node->Node.FuncCallStmnt.Actuals, 1);
	
	nameStmnt(node->Node.Stmnt.Next);
}
void nameFuncCallExpr(t_tree node)
{
	if (nameCurrentPrimitive == NULL)
		checkIdUndefined(node->Node.FuncCallExpr.FuncName, node->LineNr);
	else
		checkIdUndefinedInPrimitive(&node->Node.FuncCallExpr.FuncName, node->LineNr);

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
void nameVecValue(t_tree node)
{
	int i;
	for (i = 0; i < 3; i++)
		nameExpr(node->Node.VecValue.Values[i]);
}
void nameMatValue(t_tree node)
{
	int i;
	for (i = 0; i < 9; i++)
		nameExpr(node->Node.MatValue.Values[i]);
}

void nameCompValue(t_tree node)
{
	checkIdUndefined(node->Node.CompValue.Id, node->LineNr);
}

void nameGoto(t_tree node)
{
	nameStmnt(node->Node.Stmnt.Next);
	checkIdUndefined(node->Node.Goto.Id, node->LineNr);
	nameStmnt(node->Node.Stmnt.Next);
}

void nameRValue(t_tree node)
{
	checkIdUndefined(node->Node.RValue.Id, node->LineNr);
}
void nameLValue(t_tree node)
{
	checkIdUndefined(node->Node.LValue.Id, node->LineNr);
}

void nameLabel(t_tree node)
{
	checkIdExists(node->Node.Label.Id, node->LineNr, LABEL, NAME_TABLE_VARIABLE);
	nameStmnt(node->Node.Stmnt.Next);
}

t_symtable *nameAnalysis(t_tree node)
{
	scope = NULL;
	nameCurrentPrimitive = NULL;
	nameErrorType = 0;
	return nameProgram(node);
}
