/* 
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


#endif
