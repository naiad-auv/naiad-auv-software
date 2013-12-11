/* FILE:       offset.c
   CONTENTS:   offset.c - This performs offset calculations on the variables for NaiAda compiler
   AUTHOR:     Per-Erik Måhl
*/

#include "offset.h"
#include "ast.h"
#include <stdio.h>
#include "symtab.h"

// helper functions
int offsetSizeOf(eType type); // returns size of type

// AST functions
void offsetProgram(t_tree node);
void offsetFunction(t_tree node);
void offsetVariable(t_tree node, int formal, int local);
void offsetFormal(t_tree node, int * curoffset);
void offsetLocal(t_tree node, int * curoffset);


int offsetSizeOf(eType type)
{
	switch (type)
	{
	case ERROR_TYPE:
		printf("Error in offset");
		return -1;
	case VOID:
		return 0;
	default:
		return 1;
	}
}

void offsetProgram(t_tree node)
{
	offsetFunction(node->Node.Program.Functions);
}

void offsetFunction(t_tree node)
{
	if (node == NULL)
		return;

	scope = FindId(node->Node.Function.Name, scope);
	
	// go through var list and calc offsets..
	// formals start at offset 2 and locals start at offset 0
	offsetVariable(node->Node.Function.Variables, 2, 0);

	scope = scope->parent;

	offsetFunction(node->Node.Function.Next);
}

void offsetVariable(t_tree node, int formal, int local)
{
	if (node == NULL)
		return;
	if (node->Node.Variable.VarKind == kFormal)
		offsetFormal(node, &formal);
	else
		offsetLocal(node, &local);

	offsetVariable(node->Node.Variable.Next, formal, local);
}
void offsetFormal(t_tree node, int * curoffset)
{
	t_symtable * var_table;
	var_table = FindId(node->Node.Variable.Name, scope);
	var_table->offset = (*curoffset);
	(*curoffset) += offsetSizeOf(node->Node.Variable.Type);
}
void offsetLocal(t_tree node, int * curoffset)
{
	t_symtable * var_table;
	var_table = FindId(node->Node.Variable.Name, scope);
	(*curoffset) -= offsetSizeOf(node->Node.Variable.Type);
	var_table->offset = (*curoffset);
}

void offsetCalc(t_tree node, t_symtable * globalScope)
{
	scope = NULL;
	scope = globalScope;
	offsetProgram(node);
	scope = scope->parent;
}
