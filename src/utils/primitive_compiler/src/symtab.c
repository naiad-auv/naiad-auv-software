/* FILE:       symtab.c
   CONTENTS:   symtab.c - This manages symbol tables for NaiAda compiler
   AUTHOR:     Per-Erik Måhl
*/

#include "symtab.h"
#include <string.h>
#include <stdlib.h>

t_symtable * FindId(const char * id, t_symtable * inTable)
{
	t_symtable * tableChildren = inTable->child;
	while (tableChildren != NULL)
	{
		if (strcmp(tableChildren->id,id) == 0)
		{
			return tableChildren;
		}
		tableChildren = tableChildren->next;
	}
	return NULL;
}

t_symtable * createFunctionTable(const char * id, int type)
{
	t_symtable * table = (t_symtable *)malloc(sizeof(t_symtable));
	table->type = type;
	table->offset = 0;
	table->parent = scope;
	if (scope != NULL)
	{
		table->next = scope->child;
		scope->child = table;
	}
	else
		table->next = NULL;

	table->child = NULL;
	table->id = id;
	return table;
}
t_symtable * createVariableTable(const char * id, int type)
{
	t_symtable * table = (t_symtable *)malloc(sizeof(t_symtable));
	table->type = type;
	table->offset = 0;
	table->parent = scope;
	if (scope != NULL)
	{
		table->next = scope->child;
		scope->child = table;
	}
	else
		table->next = NULL;
	table->child = NULL;
	table->id = id;
	return table;
}

void destroyTables(t_symtable *symtable)
{
	if (symtable == NULL)
		return;
	destroyTables(symtable->child);
	destroyTables(symtable->next);
	free(symtable);
}

t_symtable * scope;


