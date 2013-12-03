#ifndef NAME_H_
#define NAME_H_
#include "symtab.h"
#include "ast.h"

#define NAME_ERROR_TYPE_ALREADY_DEFINED		1
#define NAME_ERROR_TYPE_NOT_DEFINED			2

#define NAME_TABLE_FUNCTION					0
#define NAME_TABLE_VARIABLE					1


extern int nameErrorType;
extern int nameErrorLineNr;
extern const char * nameErrorId;


extern t_symtable *nameAnalysis(t_tree node);

#endif
