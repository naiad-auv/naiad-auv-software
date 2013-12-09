/* $Id: symbol.h 110 2009-04-26 09:31:29Z csg $
   Symbol table interface.
*/
#ifndef SYMTAB_H_
#define SYMTAB_H_
#include "ast.h"

typedef struct t_symtab t_symtab;

struct t_symtable
{
		const char * id;
		eType type;
		int offset;
		struct t_symtable * next;
		struct t_symtable * parent;
		struct t_symtable * child;
};  typedef struct t_symtable t_symtable;

extern t_symtable * scope;
extern t_symtable * createFunctionTable(const char * id, int type);
extern t_symtable * createVariableTable(const char * id, int type);
extern t_symtable * FindId(const char * id, t_symtable * inTable);
extern void destroyTables(t_symtable *symtable);


/** Returns a pointer to a new symbol table. */
extern t_symtab *symtab_create(void);

/** Destroys the symbol table.
   \param symtab A pointer to the symbol table to destroy.
   \param free A pointer to a function written by you or NULL. If not NULL it will
   be called once for each symbol in \a symtab. The parameter passed to \a free is
   the data-pointer that was associated with the symbol when \a symtab_set was called.
   \post After the call to this function \a symtab is no longer a valid pointer. */
extern void symtab_destroy(t_symtab *symtab, void (*free)(void *data));

/** Adds a new symbol to the symbol table.
   \pre \a symtab_exist(symtab,s) will return 0.
   \param symtab The table where to add the symbol.
   \param s The symbol to add
   \post \a symtab_exist(symtab,s) will return 1.
   If the added symbol does already exist in the symbol table, and
   \a symtab_setup_search_table has been called, the result is undefined. */
extern void symtab_add(t_symtab *symtab, const char *s);

/** Checks if a symbol exists in a symbol table.
   \param symtab The table where to look for the symbol.
   \param s The symbol to look for
   \return 1 if the symbol exists (i.e. the name) else 0. */
extern int symtab_exist(t_symtab *symtab, const char *s);

/** Associate data with a certain symbol.
   \pre \a s exists in \a symtab.
   \param symtab The table where to look for the symbol.
   \param s The symbol to assiciate data with
   \param data A pointer to your data to be assiciated with \a s */
extern void symtab_set(t_symtab *symtab, const char *s, void *data);

/** Fetches the data associated with a symbol in a symbol table.
   \param symtab The table where to look for the symbol.
   \param s The symbol to look for
   \return The data associated with the symbol \a s. The return value will be NULL 
      if either of the following is the case: \n
   - \a s is not found in \a symtab. \n
   - No data has been associated with \a s using \a symtab_set
   - A NULL pointer was passed as \a data when calling \a symtab_set for symbol \a s */
extern void *symtab_get(t_symtab *symtab, const char *s);

/** Iterates a symbol table.
   \param symtab The table to iterated.
   \param call_back A function of yours that will be called once for each element in \a symtab
   The first parameter to \a call_back is the data associated with the symbol in \a symtab (by use of
   \a symtab_set ). The second parameter to \a call_back is the pointer \a supplement, i.e. the same
   pointer in all calls.
   \param supplement A pointer to somed data to be passed to \a call_back in each call. */
extern void symtab_iterate(t_symtab *symtab, void (*call_back)(void *data, void *supplement), void *supplement);

/** An optional function that may be used to optimize seacher.
   This function will create a new seach table for fast access, internal for \a symtab, if
   there is none, and re-create the existing one if there already one there.
   The point is to call this function when there are no more symbols to add to \a symtab.
   Subsequent lookups will then be more efficient. However, the re-creation of the seach
   table is costly itself, so if you call \a symtab_setup_search_table after each added symbol
   this would certainly be a sub-optimisation. */
extern int symtab_setup_search_table(t_symtab *symtab);

#endif
