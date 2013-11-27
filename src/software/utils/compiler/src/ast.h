/* $Id: ast.h 110 2009-04-26 09:31:29Z csg $
  FILE:        ast.h
  CONTENTS:    ast.h   - This file contains the interface for the abstract syntax tree (AST).
  REVISION:    1.0, 960917, Christer Eriksson & Jukka Mäki-Turja
  DESCRIPTION: Exports the constructors for the various types. The definition of the data
               type is present, but should be seen as private.
*/
#ifndef _AST_H_
#define _AST_H_

typedef struct t_tree *t_tree;

/* Size of data types in trac42 */
# define INT_SIZE      1
# define BOOL_SIZE     1
# define STRING_SIZE 100

/* To distinguish between the node contents. */
typedef enum {
   kProgram,
   kFunction,
   kVariable,
   kAssign,
   kIf,
   kWhile,
   kRead,
   kWrite,
   kFuncCallStmnt,
   kReturn,
   kActual,
   kUnary,
   kBinary,
   kIntConst,
   kBoolConst,
   kStringConst,
   kFuncCallExpr,
   kRValue
} NODETYPE;

/* The NEG/SUB originates in the scanner where we not yet know which one it is. This unifiles them
   to the same value, which makes life a bit easier. */
#define MINUS 0

/* To distinguish between different kinds of unary expression nodes. */
typedef enum { NEG=MINUS, NOT } UNOP_KIND;

/* To distinguish between different kinds of binary expression nodes. */
typedef enum { SUB=MINUS, PLUS, MULT, DIV, OR, AND, EQ, LT, LE, ME, MT, NE } BINOP_KIND;

/* To distinguish between formal parameters and local variables in variable nodes. */
typedef enum {kFormal, kLocal} vKind;

/* To distinguish between the data types in the trac42 language. */
typedef enum {VOID, BOOL, INT, STRING, ERROR_TYPE} eType;

/* The program. */
typedef struct {
   t_tree Functions;  /* A list of functions in the program. */
} yProgram;

/* The function. */
typedef struct {
   t_tree Next;
   t_tree Variables;  /* Local variables as well as formal parameters. */
   t_tree Stmnts;     /* A list of statements at the top level in the funktion. */
   char *Name;       /* The function name. */
   eType Type;       /* The return type. */
} yFunction;

/* The variable (local variable or formal parameter). */
typedef struct {
   t_tree Next;
   vKind VarKind;    /* Tells if the variable is a local or a formal parameter. */
   char *Name;       /* The name of the variable. */
   eType Type;       /* The declared type. */
} yVariable;

/* A virtual Node to access the Next in every stmnt */
typedef struct {
   t_tree Next;
} yStmnt;

/* The Assignment statement. */
typedef struct {
   t_tree Next;
   char *Id;         /* The name of the variable on the left hand side of the assignment. */
   t_tree Expr;       /* The expression on the right hand side. */
} yAssign;

/* The if statement. */
typedef struct {
   t_tree Next;
   t_tree Expr;       /* The conditional statement. */
   t_tree Then;       /* The list of statements in the true branch of the if-statement. */
   t_tree Else;       /* The list of statements in the false branch of the if-statement. */
} yIf;

/* The while statement. */
typedef struct {
   t_tree Next;
   t_tree Expr;       /* The conditional statement. */
   t_tree Stmnt;      /* The list of statements in body of the while-statement. */
} yWhile;

/* The read statement. */
typedef struct {
   t_tree Next;
   char *Id;         /* The name of the variable to be read to. */
} yRead;

/* The write statement. */
typedef struct {
   t_tree Next;
   t_tree Expr;       /* The expression whose value is to be written. */
   eType Type; // added!
} yWrite;

/* The return statement. */
typedef struct {
   t_tree Next;
   t_tree Expr;       /* The expression whose value is to be returned. */
} yReturn;

/* The function call statement. */
typedef struct {
   t_tree Next;
   t_tree Actuals;    /* A list of actual arguments passed to the called function. */
   char *FuncName;   /* The name of the called function. */
} yFuncCallStmnt;

/* The actual argument (this is just a wrapper to an expression). */
typedef struct {
   t_tree Next;
   t_tree Expr;       /* The expression of the actual argument. */
   int Number; // added!
} yActual;

/* The unary expression. */
typedef struct {
   UNOP_KIND Operator; /* The operator type (! or -) */
   t_tree Expr;             /* The sub-expression to operate on. */
   eType Type;	// added!
} yUnary;

/* The binary expression. */
typedef struct {
   t_tree LeftOperand;      /* The left hand side sub-expression to operate on. */
   BINOP_KIND Operator; /* The operator type */
   t_tree RightOperand;     /* The right hand side sub-expression to operate on. */
   eType Type; // added!
} yBinary;

/* The int constant expression. */
typedef struct {
   int Value;        /* The integer value of the constant */
} yIntConst;

/* The bool constant expression. */
typedef struct {
   int Value;        /* The integer equivalent of the boolean value of the constant */
} yBoolConst;

/* The string constant expression. */
typedef struct {
   char *Value;     /* The string value of this constant. */
} yStringConst;

/* The function call expression. */
typedef struct {
   t_tree Actuals;    /* A list of actual arguments to the function. */
   char *FuncName;  /* The name of the called function. */
} yFuncCallExpr;

/* The variable expression. */
typedef struct {
   char *Id;        /* The name of the variable. */
} yRValue;

struct t_tree {
   NODETYPE Kind;         /* Key to know which component in the union to select. */
   int LineNr;
   union {
      yProgram Program;
      yFunction Function;
      yVariable Variable;
      yStmnt Stmnt;
      yAssign Assign;
      yIf If;
      yWhile While;
      yRead Read;
      yWrite Write;
      yReturn Return;
      yFuncCallStmnt FuncCallStmnt;
      yFuncCallExpr FuncCallExpr;
      yActual Actual;
      yUnary Unary;
      yBinary Binary;
      yIntConst IntConst;
      yBoolConst BoolConst;
      yStringConst StringConst;
      yRValue RValue;
   } Node;
};

extern t_tree treeRoot;

/* Returns a pointer to a program node. */
extern t_tree mProgram(t_tree pFunctions);

/* Returns a pointer to a function node. */
extern t_tree mFunction(t_tree pVariables, t_tree pStmnts, const char *pName, eType pType, int pLineNr);

/* Returns a pointer to a variable definition node. */
extern t_tree mVariable(vKind pVarKind, const char *pName, eType pType, int pLineNr);

/* Returns a pointer to an assignment statement node. */
extern t_tree mAssign(const char *pId, t_tree pExpr, int pLineNr);

/* Returns a pointer to an if statement node. */
extern t_tree mIf(t_tree pExpr, t_tree pThen, t_tree pElse, int pLineNr);

/* Returns a pointer to a while statement node. */
extern t_tree mWhile(t_tree pExpr, t_tree pStmnts, int pLineNr);

/* Returns a pointer to a read statement node. */
extern t_tree mRead(const char *pId, int pLineNr);

/* Returns a pointer to a write statement node. */
extern t_tree mWrite(t_tree pExpr, int pLineNr);

/* Returns a pointer to a return statement node. */
extern t_tree mReturn(t_tree pExpr, int pLineNr);

/* Returns a pointer to a function call statement node. */
extern t_tree mFuncCallStmnt(t_tree pActuals, const char *pfuncName, int pLineNr);

/* Returns a pointer to a function call expression node. */
extern t_tree mFuncCallExpr(t_tree pActuals, const char *pfuncName, int pLineNr);

/* Returns a pointer to an actual argument node. */
extern t_tree mActual(t_tree pExpr);

/* Returns a pointer to a unary expression node. */
extern t_tree mUnary(UNOP_KIND pOperator, t_tree pExpr, int pLineNr);

/* Returns a pointer to a binary expression node. */
extern t_tree mBinary(t_tree pLeftOperand, BINOP_KIND pOperator, t_tree pRightOperand, int pLineNr);

/* Returns a pointer to an integer constant expression node. */
extern t_tree mIntConst(int pValue, int pLineNr);

/* Returns a pointer to a bool constant expression node. */
extern t_tree mBoolConst(int pValue, int pLineNr);

/* Returns a pointer to a string constant expression node. */
extern t_tree mStringConst(const char *pValue, int pLineNr);

/* Returns a pointer to an rvalue(identifier) expression node. */
extern t_tree mRValue(const char *pId, int pLineNr);

/* Returns a pointer to a list of functions where pFunction has been concatenated at the end of pFunctions. */
extern t_tree connectFunctions(t_tree pFunctions, t_tree pFunction);

/* Returns a pointer to a list of variable nodes where second is a list of variables that has been concatenated at
   the end of the variable list first. The lists may be of any length. */
extern t_tree connectVariables(t_tree pVariables, t_tree pVariable);

/* Returns a pointer to a list of statements where pStmnt has been concatenated at the end of pStmnts. */
extern t_tree connectStmnts(t_tree pStmnts, t_tree pStmnt);

/* Returns a pointer to a list of actual arguments where pActual has been concatenated at the end of pActuals. */
extern t_tree connectActuals(t_tree pActuals, t_tree pActual);

/* Returns a pointer to a list of variables consisting of the variables in pVariables updated with the type pType. */
extern t_tree addType(t_tree pVariables, eType pType);

/* To be used for cleanup when finished. */
extern void destroy_node(t_tree node);

extern void destroy_tree(t_tree node);

#endif
