/* FILE:       regennaiada.c
   CONTENTS:   regennaiada.c - This regenerates the NaiAda code back from the AST
   AUTHOR:     Per-Erik Måhl
*/

#include "regennaiada.h"


int regenNaiAdaTabIndex; // keeps track of current tab index
FILE * regenNaiAdaFilePtr; // pointer to file object for output
t_tree current_primitive; // pointer to current primitive

// helper functions
void regenNaiAdaInsertTab();
void regenNaiAdaRemoveTab();
void regenNaiAdaNewLine();


// functions to iterate through AST
void regenNaiAdaProgram(t_tree node);
void regenNaiAdaPrimitive(t_tree node);
void regenNaiAdaFunction(t_tree node);
void regenNaiAdaFormal(t_tree node, int first);
void regenNaiAdaLocal(t_tree node);
void regenNaiAdaPrimVariable(t_tree node);
void regenNaiAdaVariable(t_tree node, int first, vKind varkind);
void regenNaiAdaAssign(t_tree node);
void regenNaiAdaIf(t_tree node);
void regenNaiAdaWhile(t_tree node);
void regenNaiAdaLoop(t_tree node);
void regenNaiAdaExit(t_tree node);
void regenNaiAdaLabel(t_tree node);
void regenNaiAdaGoto(t_tree node);
void regenNaiAdaAsm(t_tree node);
void regenNaiAdaReturn(t_tree node);
void regenNaiAdaFuncCallStmnt(t_tree node);
void regenNaiAdaFuncCallExpr(t_tree node);
void regenNaiAdaActual(t_tree node, int first);
void regenNaiAdaUnary(t_tree node);
void regenNaiAdaBinary(t_tree node);
void regenNaiAdaIntConst(t_tree node);
void regenNaiAdaBoolConst(t_tree node);
void regenNaiAdaFloatConst(t_tree node);
void regenNaiAdaCompValue(t_tree node);
void regenNaiAdaVecValue(t_tree node);
void regenNaiAdaMatValue(t_tree node);
void regenNaiAdaRValue(t_tree node);
void regenNaiAdaLValue(t_tree node);

// increases tabindex
void regenNaiAdaInsertTab()
{
	regenNaiAdaTabIndex++;
}

// decreases tabindex
void regenNaiAdaRemoveTab()
{
	regenNaiAdaTabIndex--;
}

// makes a line break and tabs in according to tab index
void regenNaiAdaNewLine()
{
	int i = regenNaiAdaTabIndex;
	fprintf(regenNaiAdaFilePtr, "\n");
	while (i > 0)
	{
		fprintf(regenNaiAdaFilePtr, "\t");
		i--;
	}
}

// generic function for handling statements in AST
void regenNaiAdaStmnt(t_tree node)
{
	if (node == NULL)
		return;

	switch(node->Kind)
	{
	case kAssign:
		regenNaiAdaAssign(node);
		break;
	case kIf:
		regenNaiAdaIf(node);
		break;
	case kWhile:
		regenNaiAdaWhile(node);
		break;
	case kFuncCallStmnt:
		regenNaiAdaFuncCallStmnt(node);
		break;
	case kReturn:
		regenNaiAdaReturn(node);
		break;
	case kLoop:
		regenNaiAdaLoop(node);
		break;
	case kExit:
		regenNaiAdaExit(node);
		break;
	case kAsm:
		regenNaiAdaAsm(node);
		break;
	case kLabel:
		regenNaiAdaLabel(node);
		break;
	case kGoto:
		regenNaiAdaGoto(node);
		break;
	default:
		// error
		fprintf(regenNaiAdaFilePtr, "error ");
		break;		
	}
}

// generic function to handle expressions in AST
void regenNaiAdaExpr(t_tree node)
{
	switch(node->Kind)
	{
	case kUnary:
		regenNaiAdaUnary(node);
		break;
	case kBinary:
		regenNaiAdaBinary(node);
		break;
	case kIntConst:
		regenNaiAdaIntConst(node);
		break;
	case kBoolConst:
		regenNaiAdaBoolConst(node);
		break;
	case kFloatConst:
		regenNaiAdaFloatConst(node);
		break;
	case kVecValue:
		regenNaiAdaVecValue(node);
		break;
	case kMatValue:
		regenNaiAdaMatValue(node);
		break;
	case kFuncCallExpr:
		regenNaiAdaFuncCallExpr(node);
		break;
	case kRValue:
		regenNaiAdaRValue(node);
		break;
	case kLValue:
		regenNaiAdaLValue(node);
		break;
	case kCompValue:
		regenNaiAdaCompValue(node);
		break;
	default:
		// error
		fprintf(regenNaiAdaFilePtr, "error ");
		break;		
	}
}

// handes the root of the AST
void regenNaiAdaProgram(t_tree node)
{
	// call smt for primitive or function
	regenNaiAdaPrimitive(node->Node.Program.CompUnits);
}

// handles variables of both kinds
void regenNaiAdaVariable(t_tree node, int first, vKind varkind)
{
	if (node == NULL)
	{
		if (varkind == kFormal && first == 0)
			fprintf(regenNaiAdaFilePtr, ")");
		return;
	}
	switch (node->Node.Variable.VarKind)
	{
	case kFormal:
		if (varkind == kFormal)
			regenNaiAdaFormal(node, first);
		else
			regenNaiAdaVariable(node->Node.Variable.Next, first, varkind);
		break;
	case kLocal:
		if (varkind == kLocal)
			regenNaiAdaLocal(node);
		else
			regenNaiAdaVariable(node->Node.Variable.Next, first, varkind);
		break;
	}
}

void regenNaiAdaPrimitiveVariables(t_tree node)
{
	if (node == NULL)
		return;
	
	
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, node->Node.Variable.Name);
	
	switch (node->Node.Variable.VarKind)
	{
	case kLocal:
		fprintf(regenNaiAdaFilePtr, " : in ");
		switch (node->Node.Variable.Type)
		{	
		case BOOL:	
			fprintf(regenNaiAdaFilePtr, "boolean;");
			break;
		case FLOAT:
			fprintf(regenNaiAdaFilePtr, "float;");
			break;
		case INT:
			fprintf(regenNaiAdaFilePtr, "integer;");
			break;
		case VECTOR:
			fprintf(regenNaiAdaFilePtr, "vector;");
			break;
		case MATRIX:
			fprintf(regenNaiAdaFilePtr, "matrix;");
			break;
		default:
			// error
			fprintf(regenNaiAdaFilePtr, "error ");
			break;
		}
		break;
	case kFormal:
		fprintf(regenNaiAdaFilePtr, " : out ");
		switch (node->Node.Variable.Type)
		{	
		case BOOL:	
			fprintf(regenNaiAdaFilePtr, "boolean;");
			break;
		case FLOAT:
			fprintf(regenNaiAdaFilePtr, "float;");
			break;
		case INT:
			fprintf(regenNaiAdaFilePtr, "integer;");
			break;
		case VECTOR:
			fprintf(regenNaiAdaFilePtr, "vector;");
			break;
		case MATRIX:
			fprintf(regenNaiAdaFilePtr, "matrix;");
			break;
		default:
			// error
			fprintf(regenNaiAdaFilePtr, "error ");
			break;
		}
		break;
	}
	regenNaiAdaPrimitiveVariables(node->Node.Variable.Next);
}


void regenNaiAdaPrimitive(t_tree node)
{
	if (node == NULL)
		return;

	if (node->Kind == kFunction)
		regenNaiAdaFunction(node);
	else
	{
		fprintf(regenNaiAdaFilePtr, "primitive ");
		fprintf(regenNaiAdaFilePtr, node->Node.Primitive.Name);
		fprintf(regenNaiAdaFilePtr, " is");
		regenNaiAdaInsertTab();
		regenNaiAdaNewLine();
		current_primitive = node;
		
		regenNaiAdaPrimitiveVariables(node->Node.Primitive.Variables);
		regenNaiAdaNewLine();		
		regenNaiAdaNewLine();		

		regenNaiAdaFunction(node->Node.Primitive.Functions);

		regenNaiAdaRemoveTab();
		regenNaiAdaNewLine();		
		fprintf(regenNaiAdaFilePtr, "end ");
		fprintf(regenNaiAdaFilePtr, node->Node.Primitive.Name);
		fprintf(regenNaiAdaFilePtr, ";");
		regenNaiAdaNewLine();
		regenNaiAdaNewLine();
		current_primitive = NULL;
		regenNaiAdaPrimitive(node->Node.Primitive.Next);
	}
}



// handles function bodies and calls the next function in the next-chain
void regenNaiAdaFunction(t_tree node)
{
	if (node == NULL)
		return;

	if (node->Node.Function.Type == VOID)
		fprintf(regenNaiAdaFilePtr, "procedure ");
	else
		fprintf(regenNaiAdaFilePtr, "function ");


	fprintf(regenNaiAdaFilePtr, node->Node.Function.Name);

	regenNaiAdaVariable(node->Node.Function.Variables, 1, kFormal);
	
	if (node->Node.Function.Type != VOID)
	{
		switch (node->Node.Function.Type)
		{	
		case BOOL:	
			fprintf(regenNaiAdaFilePtr, " return boolean");
			break;
		case FLOAT:
			fprintf(regenNaiAdaFilePtr, " return float");
			break;
		case INT:
			fprintf(regenNaiAdaFilePtr, " return integer");
			break;
		case VECTOR:
			fprintf(regenNaiAdaFilePtr, " return vector");
			break;
		case MATRIX:
			fprintf(regenNaiAdaFilePtr, " return matrix");
			break;
		default:
			// error
			fprintf(regenNaiAdaFilePtr, " error");
			break;
		}
	}

	fprintf(regenNaiAdaFilePtr, " is ");



	regenNaiAdaInsertTab();

	regenNaiAdaVariable(node->Node.Function.Variables, 0, kLocal);

	regenNaiAdaRemoveTab();
	regenNaiAdaNewLine();

	fprintf(regenNaiAdaFilePtr, "begin");

	regenNaiAdaInsertTab();

	regenNaiAdaStmnt(node->Node.Function.Stmnts);

	regenNaiAdaRemoveTab();
	regenNaiAdaNewLine();

	fprintf(regenNaiAdaFilePtr, "end ");
	fprintf(regenNaiAdaFilePtr, node->Node.Function.Name);
	fprintf(regenNaiAdaFilePtr, ";");

	regenNaiAdaNewLine();
	if (node->Node.Function.Next != NULL)
		regenNaiAdaNewLine();

	regenNaiAdaPrimitive(node->Node.Function.Next);
}

// handles formal variables, 'first' is used to keep track of the first formal to get the commas right
void regenNaiAdaFormal(t_tree node, int first)
{
	if (node == NULL)
		return;

	if (first == 1)
		fprintf(regenNaiAdaFilePtr, "(");
	else
		fprintf(regenNaiAdaFilePtr, "; ");	

	fprintf(regenNaiAdaFilePtr, node->Node.Variable.Name);

	switch (node->Node.Variable.Type)
	{
	case BOOL:
		fprintf(regenNaiAdaFilePtr, " : boolean");
		break;
	case INT:
		fprintf(regenNaiAdaFilePtr, " : integer");
		break;
	case FLOAT:
		fprintf(regenNaiAdaFilePtr, " : float");
		break;
	case VECTOR:
		fprintf(regenNaiAdaFilePtr, " : vector");
		break;
	case MATRIX:
		fprintf(regenNaiAdaFilePtr, " : matrix");
		break;
	case INT_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(integer)");
		break;
	case FLOAT_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(float)");
		break;
	case BOOL_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(boolean)");
		break;
	case VECTOR_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(vector)");
		break;
	case MATRIX_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(matrix)");
		break;
	default:
		// error
		fprintf(regenNaiAdaFilePtr, "error ");
		break;
	}

	
	regenNaiAdaVariable(node->Node.Variable.Next, 0, kFormal);
}

// handles local variables
void regenNaiAdaLocal(t_tree node)
{
	if (node == NULL)
		return;

	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, node->Node.Variable.Name);

	switch (node->Node.Variable.Type)
	{
	case BOOL:
		fprintf(regenNaiAdaFilePtr, " : boolean;");
		break;
	case INT:
		fprintf(regenNaiAdaFilePtr, " : integer;");
		break;
	case FLOAT:
		fprintf(regenNaiAdaFilePtr, " : float;");
		break;
	case VECTOR:
		fprintf(regenNaiAdaFilePtr, " : vector;");
		break;
	case MATRIX:
		fprintf(regenNaiAdaFilePtr, " : matrix;");
		break;
	case INT_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(integer);");
		break;
	case FLOAT_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(float);");
		break;
	case BOOL_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(boolean);");
		break;
	case VECTOR_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(vector);");
		break;
	case MATRIX_ADDR:
		fprintf(regenNaiAdaFilePtr, " : access(matrix);");
		break;
	default:
		// error
		fprintf(regenNaiAdaFilePtr, "error ");
		break;
	}

	regenNaiAdaVariable(node->Node.Variable.Next, 0, kLocal);
}

// handles assign statements
void regenNaiAdaAssign(t_tree node)
{
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, node->Node.Assign.Id);
	fprintf(regenNaiAdaFilePtr, " := ");
	regenNaiAdaExpr(node->Node.Assign.Expr);
	fprintf(regenNaiAdaFilePtr, ";");
	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}

// handles if statements
void regenNaiAdaIf(t_tree node)
{
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "if ");
	regenNaiAdaExpr(node->Node.If.Expr);
	fprintf(regenNaiAdaFilePtr, " then");	

	regenNaiAdaInsertTab();
	regenNaiAdaStmnt(node->Node.If.Then);
	regenNaiAdaRemoveTab();

	if (node->Node.If.Else != NULL)
	{
		regenNaiAdaNewLine();
		fprintf(regenNaiAdaFilePtr, "else");

		regenNaiAdaInsertTab();
		regenNaiAdaStmnt(node->Node.If.Else);
		regenNaiAdaRemoveTab();
	}

	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "end if;");	
	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}

// handles while statements
void regenNaiAdaWhile(t_tree node)
{
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "while ");
	regenNaiAdaExpr(node->Node.While.Expr);
	fprintf(regenNaiAdaFilePtr, " loop");	

	regenNaiAdaInsertTab();
	regenNaiAdaStmnt(node->Node.While.Stmnt);
	regenNaiAdaRemoveTab();

	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "end loop;");	

	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}

// handles loop statements
void regenNaiAdaLoop(t_tree node)
{
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "loop");

	regenNaiAdaInsertTab();
	regenNaiAdaStmnt(node->Node.Loop.Stmnt);
	regenNaiAdaRemoveTab();

	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "end loop;");	

	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}


// handles exit statements
void regenNaiAdaExit(t_tree node)
{
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "exit;");

	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}

// handles asm statements
void regenNaiAdaAsm(t_tree node)
{
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "smc(\"");
	fprintf(regenNaiAdaFilePtr, node->Node.Asm.Arg);
	fprintf(regenNaiAdaFilePtr, "\");");

	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}



// handles return statements
void regenNaiAdaReturn(t_tree node)
{
	regenNaiAdaNewLine();
	if (node->Node.Return.Expr != NULL)
	{
		fprintf(regenNaiAdaFilePtr, "return ");
		regenNaiAdaExpr(node->Node.Return.Expr);
		fprintf(regenNaiAdaFilePtr, ";");
	}
	else
		fprintf(regenNaiAdaFilePtr, "return;");

	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}

// handles function call statements
void regenNaiAdaFuncCallStmnt(t_tree node)
{
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, node->Node.FuncCallStmnt.FuncName);
	fprintf(regenNaiAdaFilePtr, "(");

	regenNaiAdaActual(node->Node.FuncCallStmnt.Actuals, 1);
	fprintf(regenNaiAdaFilePtr, ");");
	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}

// handles function call expressions
void regenNaiAdaFuncCallExpr(t_tree node)
{
	fprintf(regenNaiAdaFilePtr, node->Node.FuncCallExpr.FuncName);
	fprintf(regenNaiAdaFilePtr, "(");

	regenNaiAdaActual(node->Node.FuncCallExpr.Actuals, 1);
	fprintf(regenNaiAdaFilePtr, ")");
}

// handles the actual function arguments for funccallexpr/funccallstmnt
// 'first' is used to keep track of first argument to get the commas right
void regenNaiAdaActual(t_tree node, int first)
{
	if (node == NULL)
		return;

	if (first == 0)
		fprintf(regenNaiAdaFilePtr, ", ");

	regenNaiAdaExpr(node->Node.Actual.Expr);
	regenNaiAdaActual(node->Node.Actual.Next, 0);
}

// handles unary expressions
void regenNaiAdaUnary(t_tree node)
{
	switch(node->Node.Unary.Operator)
	{
	case NEG:
		fprintf(regenNaiAdaFilePtr, "-(");
		break;
	case NOT:
		fprintf(regenNaiAdaFilePtr, "not(");
		break;
	case FLOATOP:
		fprintf(regenNaiAdaFilePtr, "float(");
		break;
	case INTOP:
		fprintf(regenNaiAdaFilePtr, "integer(");
		break;		
	case SIN:
		fprintf(regenNaiAdaFilePtr, "sin(");
		break;
	case ASIN:
		fprintf(regenNaiAdaFilePtr, "arcsin(");
		break;
	case COS:
		fprintf(regenNaiAdaFilePtr, "cos(");
		break;
	case ACOS:
		fprintf(regenNaiAdaFilePtr, "arccos(");
		break;
	case ABS:
		fprintf(regenNaiAdaFilePtr, "abs(");
		break;
	case SQRT:
		fprintf(regenNaiAdaFilePtr, "sqrt(");
		break;
	default:
		fprintf(regenNaiAdaFilePtr, "error");
		break;
	}
	regenNaiAdaExpr(node->Node.Unary.Expr);
	fprintf(regenNaiAdaFilePtr, ")");
}

// handles binary expressions
void regenNaiAdaBinary(t_tree node)
{
	fprintf(regenNaiAdaFilePtr, "(");
	regenNaiAdaExpr(node->Node.Binary.LeftOperand);

	switch (node->Node.Binary.Operator)
	{
	case SUB:
		fprintf(regenNaiAdaFilePtr, " - ");
		break;
	case PLUS:
		fprintf(regenNaiAdaFilePtr, " + ");
		break;
	case MULT:
		fprintf(regenNaiAdaFilePtr, " * ");
		break;
	case DIV:
		fprintf(regenNaiAdaFilePtr, " / ");
		break;
	case OR:
		fprintf(regenNaiAdaFilePtr, " or ");
		break;
	case AND:
		fprintf(regenNaiAdaFilePtr, " and ");
		break;
	case EQ:
		fprintf(regenNaiAdaFilePtr, " == ");
		break;
	case LT:
		fprintf(regenNaiAdaFilePtr, " < ");
		break;
	case LE:
		fprintf(regenNaiAdaFilePtr, " <= ");
		break;
	case MT:
		fprintf(regenNaiAdaFilePtr, " > ");
		break;
	case ME:
		fprintf(regenNaiAdaFilePtr, " >= ");
		break;
	default:
		fprintf(regenNaiAdaFilePtr, " error ");
		break;
	}

	regenNaiAdaExpr(node->Node.Binary.RightOperand);
	fprintf(regenNaiAdaFilePtr, ")");
}

// handles int consts
void regenNaiAdaIntConst(t_tree node)
{
	fprintf(regenNaiAdaFilePtr, "%d", node->Node.IntConst.Value);
}

// handles bool consts
void regenNaiAdaBoolConst(t_tree node)
{
	fprintf(regenNaiAdaFilePtr, node->Node.BoolConst.Value);
}

// handles float consts
void regenNaiAdaFloatConst(t_tree node)
{
	fprintf(regenNaiAdaFilePtr, "%f", node->Node.FloatConst.Value);
}

// handles vector values
void regenNaiAdaVecValue(t_tree node)
{
	fprintf(regenNaiAdaFilePtr, "[");
	regenNaiAdaExpr(node->Node.VecValue.Values[0]);
	fprintf(regenNaiAdaFilePtr, ", ");
	regenNaiAdaExpr(node->Node.VecValue.Values[1]);
	fprintf(regenNaiAdaFilePtr, ", ");
	regenNaiAdaExpr(node->Node.VecValue.Values[2]);
	fprintf(regenNaiAdaFilePtr, "]");
}

// handles vector values
void regenNaiAdaMatValue(t_tree node)
{
	fprintf(regenNaiAdaFilePtr, "[");

	fprintf(regenNaiAdaFilePtr, "[");
	regenNaiAdaExpr(node->Node.MatValue.Values[0]);
	fprintf(regenNaiAdaFilePtr, ", ");
	regenNaiAdaExpr(node->Node.MatValue.Values[1]);
	fprintf(regenNaiAdaFilePtr, ", ");
	regenNaiAdaExpr(node->Node.MatValue.Values[2]);
	fprintf(regenNaiAdaFilePtr, "], ");

	fprintf(regenNaiAdaFilePtr, "[");
	regenNaiAdaExpr(node->Node.MatValue.Values[3]);
	fprintf(regenNaiAdaFilePtr, ", ");
	regenNaiAdaExpr(node->Node.MatValue.Values[4]);
	fprintf(regenNaiAdaFilePtr, ", ");
	regenNaiAdaExpr(node->Node.MatValue.Values[5]);
	fprintf(regenNaiAdaFilePtr, "], ");

	fprintf(regenNaiAdaFilePtr, "[");
	regenNaiAdaExpr(node->Node.MatValue.Values[6]);
	fprintf(regenNaiAdaFilePtr, ", ");
	regenNaiAdaExpr(node->Node.MatValue.Values[7]);
	fprintf(regenNaiAdaFilePtr, ", ");
	regenNaiAdaExpr(node->Node.MatValue.Values[8]);
	fprintf(regenNaiAdaFilePtr, "]");

	fprintf(regenNaiAdaFilePtr, "]");
}


void regenNaiAdaLValue(t_tree node)
{
	fprintf(regenNaiAdaFilePtr, "access(");
	fprintf(regenNaiAdaFilePtr, node->Node.LValue.Id);
	fprintf(regenNaiAdaFilePtr, ")");
}


void regenNaiAdaRValue(t_tree node)
{
	fprintf(regenNaiAdaFilePtr, node->Node.RValue.Id);
}

void regenNaiAdaCompValue(t_tree node)
{
	if (node->Node.CompValue.type == VECTOR)
	{
		fprintf(regenNaiAdaFilePtr, "%s.%s", node->Node.CompValue.Id, (node->Node.CompValue.iComp == 1 ? "X" : (node->Node.CompValue.iComp == 2 ? "Y" : "Z")));		
	}
	else if (node->Node.CompValue.type == MATRIX)
	{
		fprintf(regenNaiAdaFilePtr, "%s.%sVector", node->Node.CompValue.Id, (node->Node.CompValue.iComp == 1 ? "X" : (node->Node.CompValue.iComp == 2 ? "Y" : "Z")));		
	}
	else
		fprintf(regenNaiAdaFilePtr, "error");
}

void regenNaiAdaLabel(t_tree node)
{
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "<< ");
	fprintf(regenNaiAdaFilePtr, node->Node.Label.Id);
	fprintf(regenNaiAdaFilePtr, " >>");
	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}
void regenNaiAdaGoto(t_tree node)
{
	regenNaiAdaNewLine();
	fprintf(regenNaiAdaFilePtr, "goto ");
	fprintf(regenNaiAdaFilePtr, node->Node.Goto.Id);
	fprintf(regenNaiAdaFilePtr, ";");
	regenNaiAdaStmnt(node->Node.Stmnt.Next);
}


// global function for traversing the AST and generating code
void regenNaiAda(t_tree node)
{
	regenNaiAdaTabIndex = 0;

	regenNaiAdaFilePtr = fopen("regenerated_code.nai","w");
	if (regenNaiAdaFilePtr != NULL)
	{
		current_primitive = NULL;
		regenNaiAdaProgram(node);
		fclose(regenNaiAdaFilePtr);
	}
	else
	{
		// error
		printf("\nError regenNaiAda: Couldn't open file.\n");
	}
	
}
