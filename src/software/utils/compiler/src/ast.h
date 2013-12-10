#ifndef _AST_H_
#define _AST_H_

typedef struct t_tree *t_tree;


/* To distinguish between the node contents. */
typedef enum {
   kProgram,
   kFunction,
   kVariable,
   kAssign,
   kIf,
   kWhile,
   kLoop,
   kExit,
   kAsm,
   kFuncCallStmnt,
   kReturn,
   kActual,
   kUnary,
   kBinary,
   kCompValue,
   kIntConst,
   kBoolConst,
   kFloatConst,
   kVecValue,
   kMatValue,
   kFuncCallExpr,
   kRValue,
   kLValue
} NODETYPE;

/* The NEG/SUB originates in the scanner where we not yet know which one it is. This unifiles them
   to the same value, which makes life a bit easier. */
#define MINUS 0

/* To distinguish between different kinds of unary expression nodes. */
typedef enum { NEG=MINUS, NOT, INTOP, FLOATOP, SIN, COS, ASIN, ACOS, ABS, SQRT, ERROP } UNOP_KIND;

/* To distinguish between different kinds of binary expression nodes. */
typedef enum { SUB=MINUS, PLUS, MULT, DIV, OR, AND, EQ, LT, LE, ME, MT, NE } BINOP_KIND;

/* To distinguish between formal parameters and local variables in variable nodes. */
typedef enum {kFormal, kLocal} vKind;

/* To distinguish between the data types. */
typedef enum {VOID=0, BOOL, INT, FLOAT, VECTOR, MATRIX, BOOL_ADDR, INT_ADDR, FLOAT_ADDR, VECTOR_ADDR, MATRIX_ADDR, ERROR_TYPE } eType;

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

/* The while statement. */
typedef struct {
   t_tree Next;
   t_tree Stmnt;      /* The list of statements in body of the while-statement. */
} yLoop;

/* The exit statement. */
typedef struct {
   t_tree Next;
} yExit;

/* The asm statement. */
typedef struct {
   t_tree Next;
   char *Arg;
} yAsm;

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
   eType LeftType;
   eType RightType;
} yBinary;


/* The component value expression (for vectors and matrices) */
typedef struct {
   char *Id;  
   eType type;
   int iComp;
} yCompValue;


/* The int constant expression. */
typedef struct {
   int Value;        /* The integer value of the constant */
} yIntConst;

/* The bool constant expression. */
typedef struct {
   char *Value;        /* The string equivalent of the boolean value of the constant */
} yBoolConst;

/* The float constant expression. */
typedef struct {
   float Value;     /* The float value of this constant. */
} yFloatConst;

/* The vector constant expression. */
typedef struct {
   t_tree Values[3];     /* The vector values of this constant. */
} yVecValue;

/* The matrix constant expression. */
typedef struct {
   t_tree Values[9];     /* The matrix values of this constant. */
} yMatValue;

/* The function call expression. */
typedef struct {
   t_tree Actuals;    /* A list of actual arguments to the function. */
   char *FuncName;  /* The name of the called function. */
} yFuncCallExpr;

/* The variable expression. */
typedef struct {
   char *Id;        /* The name of the variable. */
} yRValue;

/* The access variable expression. */
typedef struct {
   char *Id;        /* The name of the variable. */
} yLValue;

struct t_tree {
   NODETYPE Kind;         /* Key to know which component in the union to select. */
   int LineNr;
   union {
      yProgram Program;
      yFunction Function;
      yVariable Variable;
      yStmnt Stmnt;
      yLoop Loop;
      yExit Exit;
      yAsm Asm;
      yAssign Assign;
      yIf If;
      yWhile While;
      yReturn Return;
      yFuncCallStmnt FuncCallStmnt;
      yFuncCallExpr FuncCallExpr;
      yActual Actual;
      yUnary Unary;
      yBinary Binary;
      yCompValue CompValue;
      yIntConst IntConst;
      yBoolConst BoolConst;
      yFloatConst FloatConst;
      yVecValue VecValue;
      yMatValue MatValue;
      yRValue RValue;
      yLValue LValue;
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



// mLoop($2, $1)
extern t_tree mLoop(t_tree pStmnts, int pLineNr);

// mExit($1)
extern t_tree mExit(int pLineNr);

extern t_tree mAsm(const char * pArgument, int pLineNr);


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
extern t_tree mBoolConst(const char *pValue, int pLineNr);


// mFloatConst($1.floatVal, $1.lineNr)
extern t_tree mFloatConst(float fValue, int pLineNr);

// mVecConst($2.floatVal, $4.floatVal, $6.floatVal, $2.lineNr)
extern t_tree mVecValue(t_tree fXValue, t_tree fYValue, t_tree fZValue);


// mMatConst($3.floatVal, $5.floatVal, $7.floatVal, $11.floatVal, $13.floatVal, $15.floatVal, $19.floatVal, $21.floatVal, $23.floatVal, $3.lineNr)
extern t_tree mMatValue(t_tree fAAValue, t_tree fABValue, t_tree fACValue, 
			t_tree fBAValue, t_tree fBBValue, t_tree fBCValue, 
			t_tree fCAValue, t_tree fCBValue, t_tree fCCValue);

extern t_tree mCompValue(const char *pValue, int pLineNr, int iComp, eType type);


/* Returns a pointer to an rvalue(identifier) expression node. */
extern t_tree mLValue(const char *pId, int pLineNr);


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
