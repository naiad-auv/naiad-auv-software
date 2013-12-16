/* FILE:       ast.c
   CONTENTS:   ast.c - This manages the abstract syntax tree for NaiAda compiler. (based on skeleton from lab 3 in a compiler theory course at Mälardalen University)
   AUTHOR:     Per-Erik Måhl
*/

# include "ast.h"
# include "utils.h"
# include "naiada.h"
# include <stdio.h>
# include <assert.h>
# include <string.h>
# include <stdlib.h>

# define connectMacro(component, first, second)      {      \
   t_tree node = first;                                      \
   if (node == NULL)                                        \
      return second;                                        \
   else                                                     \
      while (node->Node.component.Next != NULL)             \
         node = node->Node.component.Next;                  \
   node->Node.component.Next = second;                      \
  return first;                                             \
}

t_tree treeRoot;

/* Allocates space and initilizes a node with kind and line nr. */
static t_tree allocateNode(NODETYPE pKind, int pLineNr)
{
   t_tree node = (t_tree)calloc (1, sizeof (struct t_tree));
   assert(node);
   node->Kind = pKind;
   node->LineNr = pLineNr;
   return node;
}

t_tree mProgram(t_tree pFunctions)
{
   t_tree node = allocateNode(kProgram, -1);
   node->Node.Program.Functions = pFunctions;
   return node;
}

t_tree mFunction(t_tree pVariables, t_tree pStmnts, const char *pName, eType pType, int pLineNr)
{
   t_tree node = allocateNode(kFunction, pLineNr);
   node->Node.Function.Next = NULL;
   node->Node.Function.Variables = pVariables;
   node->Node.Function.Stmnts = pStmnts;
   node->Node.Function.Name = dstrcpy(pName);
   node->Node.Function.Type = pType;
   return node;
}

t_tree mVariable(vKind pVarKind, const char *pName, eType pType, int pLineNr)
{
   t_tree node = allocateNode(kVariable, pLineNr);
   node->Node.Variable.Next = NULL;
   node->Node.Variable.VarKind = pVarKind;
   node->Node.Variable.Name = dstrcpy(pName);
   node->Node.Variable.Type = pType;
   return node;
}

t_tree mAssign(const char *pId , t_tree pExpr, int pLineNr)
{
   t_tree node = allocateNode(kAssign, pLineNr);
   node->Node.Assign.Next = NULL;
   node->Node.Assign.Id = dstrcpy(pId);
   node->Node.Assign.Expr = pExpr;
   return node;
}

t_tree mIf(t_tree pExpr, t_tree pThen, t_tree pElse, int pLineNr)
{
   t_tree node = allocateNode(kIf, pLineNr);
   node->Node.If.Next = NULL;
   node->Node.If.Expr = pExpr;
   node->Node.If.Then = pThen;
   node->Node.If.Else = pElse;
   return node;
}

t_tree mWhile(t_tree pExpr, t_tree pStmnt, int pLineNr)
{
   t_tree node = allocateNode(kWhile, pLineNr);
   node->Node.While.Next = NULL;
   node->Node.While.Expr = pExpr;
   node->Node.While.Stmnt = pStmnt;
   return node;
}


t_tree mLoop(t_tree pStmnts, int pLineNr)
{
   t_tree node = allocateNode(kLoop, pLineNr);
   node->Node.Loop.Next = NULL;
   node->Node.Loop.Stmnt = pStmnts;
   return node;
}

t_tree mExit(int pLineNr)
{
   t_tree node = allocateNode(kExit, pLineNr);
   node->Node.Exit.Next = NULL;
   return node;
}

t_tree mAsm(const char * pArgument, int pLineNr)
{
   t_tree node = allocateNode(kAsm, pLineNr);
   node->Node.Asm.Next = NULL;
   node->Node.Asm.Arg = dstrcpy(pArgument);
   return node;
}

t_tree mReturn(t_tree pExpr, int pLineNr)
{
   t_tree node = allocateNode(kReturn, pLineNr);
   node->Node.Return.Next = NULL;
   node->Node.Return.Expr = pExpr;
   return node;
}

t_tree mFuncCallStmnt(t_tree pActuals, const char *pFuncName, int pLineNr)
{
   t_tree node = allocateNode(kFuncCallStmnt, pLineNr);
   node->Node.FuncCallStmnt.Next = NULL;
   node->Node.FuncCallStmnt.Actuals = pActuals;
   node->Node.FuncCallStmnt.FuncName = dstrcpy(pFuncName);
   return node;
}

t_tree mLabel(const char * pLabelName, int pLineNr)
{
   t_tree node = allocateNode(kLabel, pLineNr);
   node->Node.Label.Next = NULL;
   node->Node.Label.Id = dstrcpy(pLabelName);
   return node;
}

t_tree mGoto(const char * pLabelName, int pLineNr)
{
   t_tree node = allocateNode(kGoto, pLineNr);
   node->Node.Goto.Next = NULL;
   node->Node.Goto.Id = dstrcpy(pLabelName);
   return node;
}

t_tree mActual(t_tree pExpr)
{
   t_tree node = allocateNode(kActual, -1);
   node->Node.Actual.Next = NULL;
   node->Node.Actual.Expr = pExpr;
   return node;
}

t_tree mUnary(UNOP_KIND pOperator, t_tree pExpr, int pLineNr)
{
   t_tree node = allocateNode(kUnary, pLineNr);
   node->Node.Unary.Operator = pOperator;
   node->Node.Unary.Expr = pExpr;
   return node;
}

t_tree mBinary(t_tree pLeftOperand, BINOP_KIND pOperator, t_tree pRightOperand, int pLineNr)
{
   t_tree node = allocateNode(kBinary, pLineNr);
   node->Node.Binary.LeftOperand = pLeftOperand;
   node->Node.Binary.Operator = pOperator;
   node->Node.Binary.RightOperand = pRightOperand;
   return node;
}

t_tree mIntConst(int pValue, int pLineNr)
{
   t_tree node = allocateNode(kIntConst, pLineNr);
   node->Node.IntConst.Value = pValue;
   return node;
}

t_tree mBoolConst(const char *pValue, int pLineNr)
{
   t_tree node = allocateNode(kBoolConst, pLineNr);
   node->Node.BoolConst.Value = dstrcpy(pValue);
   return node;
}

t_tree mFloatConst(float fValue, int pLineNr)
{
   t_tree node = allocateNode(kFloatConst, pLineNr);
   node->Node.FloatConst.Value = fValue;
   return node;
}

t_tree mCompValue(const char *pValue, int pLineNr, int iComp, eType type)
{
   t_tree node = allocateNode(kCompValue, pLineNr);
   node->Node.CompValue.Id = dstrcpy(pValue);
   node->Node.CompValue.iComp = iComp;
   node->Node.CompValue.type = type;
   return node;
}

t_tree mVecValue(t_tree XValue, t_tree YValue, t_tree ZValue)
{
   t_tree node = allocateNode(kVecValue, XValue->LineNr);
   node->Node.VecValue.Values[0] = XValue;
   node->Node.VecValue.Values[1] = YValue;
   node->Node.VecValue.Values[2] = ZValue;
   return node;
}

t_tree mMatValue(t_tree AAValue, t_tree ABValue, t_tree ACValue, 
			t_tree BAValue, t_tree BBValue, t_tree BCValue, 
			t_tree CAValue, t_tree CBValue, t_tree CCValue)
{
   t_tree node = allocateNode(kMatValue, AAValue->LineNr);

   node->Node.MatValue.Values[0] = AAValue;
   node->Node.MatValue.Values[1] = ABValue;
   node->Node.MatValue.Values[2] = ACValue;

   node->Node.MatValue.Values[3] = BAValue;
   node->Node.MatValue.Values[4] = BBValue;
   node->Node.MatValue.Values[5] = BCValue;

   node->Node.MatValue.Values[6] = CAValue;
   node->Node.MatValue.Values[7] = CBValue;
   node->Node.MatValue.Values[8] = CCValue;

   return node;
}

t_tree mFuncCallExpr(t_tree pActuals, const char *pFuncName, int pLineNr)
{
   t_tree node = allocateNode(kFuncCallExpr, pLineNr);
   node->Node.FuncCallExpr.Actuals = pActuals;
   node->Node.FuncCallExpr.FuncName = dstrcpy(pFuncName);
   return node;
}

t_tree mRValue(const char *pId, int pLineNr)
{
   t_tree node = allocateNode(kRValue, pLineNr);
   node->Node.RValue.Id = dstrcpy(pId);
   return node;
}

t_tree mLValue(const char *pId, int pLineNr)
{
   t_tree node = allocateNode(kLValue, pLineNr);
   node->Node.LValue.Id = dstrcpy(pId);
   return node;
}

t_tree connectVariables(t_tree pVariables, t_tree pVariable)
{
   if ((pVariables && pVariables->Kind != kVariable) ||
      (pVariable && pVariable->Kind != kVariable)) {
      fprintf (stderr, "Internal error: Illegal node-type in call to function \"connectVariables\"\nProgram exits\n");
      exit(0);
   }
   connectMacro(Variable, pVariables, pVariable)
}

t_tree connectStmnts(t_tree pStmnts, t_tree pStmnt)
{
   if ((pStmnts && (pStmnts->Kind < kAssign || pStmnts->Kind > kReturn)) || (pStmnt->Kind < kAssign || pStmnt->Kind > kReturn)) {
      fprintf (stderr, "Internal error: Illegal node-type in call to function \"connectStmnts\"\nProgram exits\n");
      exit(0);
   }
   connectMacro(Stmnt, pStmnts, pStmnt)
}

t_tree connectActuals(t_tree pActuals, t_tree pActual)
{
   if ((pActuals && pActuals->Kind != kActual) ||
      (pActual && pActual->Kind != kActual)) {
      fprintf (stderr, "Internal error: Illegal node-type in call to function \"connectActuals\"\nProgram exits\n");
      exit(0);
   }
   connectMacro(Actual, pActuals, pActual)
}

t_tree connectFunctions(t_tree pFunctions, t_tree pFunction)
{
   if ((pFunctions && pFunctions->Kind != kFunction) || (pFunction && pFunction->Kind != kFunction)) {
      fprintf (stderr, "Internal error: Illegal node-type in call to function \"connectFunctions\"\nProgram exits\n");
      exit(0);
   }
   connectMacro(Function, pFunctions, pFunction)
}

t_tree addType(t_tree pVariables, eType pType)
{
   if (pVariables == NULL) return NULL;
   pVariables->Node.Variable.Type = pType;
   addType (pVariables->Node.Variable.Next, pType);
   return pVariables;
}

void destroy_node(t_tree node)
{
   switch (node->Kind) {
   case kFunction:
      free(node->Node.Function.Name);
      break;
   case kVariable:
      free(node->Node.Variable.Name);
      break;
   case kAssign:
      free(node->Node.Assign.Id);
      break;
   case kFuncCallStmnt:
      free(node->Node.FuncCallStmnt.FuncName);
      break;
   case kBoolConst:
      free(node->Node.BoolConst.Value);
      break;
   case kFuncCallExpr:
      free(node->Node.FuncCallExpr.FuncName);
      break;
   case kRValue:
      free(node->Node.RValue.Id);
      break;
   default:
      /* No memory allocated internally. */
      break;
   }
   free(node);
}

void destroy_tree(t_tree node)
{
	if (node == NULL)
		return;
	destroy_tree(node->Node.Stmnt.Next);
	destroy_node(node);
}
