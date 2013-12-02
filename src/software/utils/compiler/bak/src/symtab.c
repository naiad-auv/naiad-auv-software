/* $Id: symbol.c 110 2009-04-26 09:31:29Z csg $
   The implementation of a symbol table.
*/
#include "symtab.h"
#include "llist.h"
#include "hash.h"
#include "utils.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct t_symrec t_symrec;

struct t_symrec {
   /* This is the seach key. The memory is owned by the symrec object. */
   char *s;

   /* An (optional) pointer to the users data. */
   void *data;

   /* An up-pointer to the symtab that owns us. */
   t_symtab *symtab;
};



struct t_symtab {
   /* The storage for the symbols. The elements in this list are t_symrec*, that
      wrappes a symbol. The symtab owns the elements in this list. */
   t_llist *list;

   /* Wrapper functions to user call-back when iterating. */
   void (*iterative_call_back)(void *data, void *supplement);

   /* Wrapper functions to user call-back when deleting. */
   void (*destroy)(void *data);

   /* A temporary pointer to a possibly found symbol during seach. */
   t_symrec *symrec;

   /* A seach table for fast access. Optional. The elements in this table are t_symrec*. */
   t_hash_table *lookup_table;
};

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


/* A wrapper to that unpacks the user's data from the symbol table record in the linked list. */
static int symtab_call_back(void *data, void *supplement)
{
   t_symrec *symrec=data;
   symrec->symtab->iterative_call_back(symrec->data, supplement);
   return 1;
}

/* Returns true if the symrec (the first parameter) does not have the name of the string (the second parameter). */
static int symtab_find(void *data, void *supplement)
{
   t_symrec *symrec=data;
   const char *seach_string = supplement;
   if (strcmp(seach_string, symrec->s) == 0) {
      symrec->symtab->symrec = symrec;
      return 0;
   } else {
      return 1;
   }
}

/* Adds the symrec (the first parameter) to the hash table of the symbol table of that symrec. If hash
   insert fails (the name of the symrec already exists) it will return 0 and set the integer pointed to
   by the second parameter to 0. */
static int add_to_hash_table(void *list_data, void *ok)
{
   t_symrec *symrec=list_data;
   if (hash_insert(symrec->symtab->lookup_table, symrec->s, symrec) == 0) {
      *(int*)ok = 0;
      return 0;
   } else {
      return 1;
   }
}

static void destroy_record(void *data)
{
   t_symrec *symrec = data;
   if (symrec->symtab->destroy) {
      symrec->symtab->destroy(symrec->data);
   }
   free(symrec->s);
   free(symrec);
}

static void *get_record(t_symtab *symtab, const char *s)
{
   t_symrec *symrec;
   if (symtab->lookup_table) {
      symrec = hash_retrieve(symtab->lookup_table, s);
   } else {
      symtab->symrec = NULL;
      llist_iterate(symtab->list, symtab_find, (char*)s);
      symrec = symtab->symrec;
   }
   return symrec;
}

extern t_symtab *symtab_create(void)
{
   t_symtab *symtab = calloc(sizeof(t_symtab), 1);
   if (symtab == NULL) {
      error_message("Out of memory when creating a symbol table");
      exit(-1);
   }
   symtab->list = llist_create();
   return symtab;
}

extern void symtab_destroy(t_symtab *symtab, void (*destroy)(void *data))
{
   if (symtab->lookup_table) {
      hash_destroy(symtab->lookup_table);
   }
   symtab->destroy = destroy;
   llist_destroy(symtab->list, destroy_record);
   free(symtab);
}

extern void symtab_add(t_symtab *symtab, const char *s)
{
   t_symrec *symrec = calloc(sizeof(t_symrec), 1);
   if (symrec == NULL) {
      error_message("Out of memory when creating a symbol table record");
      exit(-1);
   }
   symrec->symtab = symtab;
   symrec->s = dstrcpy(s);
   llist_insert_last(symtab->list, symrec);
   if (symtab->lookup_table) {
      hash_insert(symtab->lookup_table, symrec->s, symrec);
   }
}

extern int symtab_exist(t_symtab *symtab, const char *s)
{
   return get_record(symtab, s) != NULL;
}

extern void symtab_set(t_symtab *symtab, const char *s, void *data)
{
   t_symrec *symrec;

   symrec = get_record(symtab, s);
   if (symrec) {
      symrec->data = data;
   }
}

extern void *symtab_get(t_symtab *symtab, const char *s)
{
   t_symrec *symrec;
   void *data;

   symrec = get_record(symtab, s);
   if (symrec) {
      data = symrec->data;
   } else {
      data = NULL;
   }
   return data;
}

extern void symtab_iterate(t_symtab *symtab, void (*call_back)(void *data, void *supplement), void *supplement)
{
   symtab->iterative_call_back = call_back;
   llist_iterate(symtab->list, symtab_call_back, supplement);
}

extern int symtab_setup_search_table(t_symtab *symtab)
{
   int ok = 1;
   if (symtab->lookup_table) {
      hash_destroy(symtab->lookup_table);
   }
   symtab->lookup_table = hash_create(llist_size(symtab->list)*1.33);
   llist_iterate(symtab->list, add_to_hash_table, &ok);
   return ok;
}
