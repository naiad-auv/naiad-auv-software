#ifndef TYPES_H_
#define TYPES_H_
#include "symtab.h"
#include "ast.h"


extern int typeErrorLineNr;


extern eType typeControl(t_tree node, t_symtable * globalScope);

#endif
