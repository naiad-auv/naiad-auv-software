#ifndef GENSMC_H_
#define GENSMC_H_
#include "symtab.h"
#include "ast.h"


extern void generateStackMachineCode(t_tree node, t_symtable * globalScope, const char * filepath);

#endif
