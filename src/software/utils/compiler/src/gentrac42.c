#include "gentrac42.h"


int genTrac42TabIndex; // keeps track of current tab index
FILE * genTrac42FilePtr; // pointer to file object for output

// helper functions
void genTrac42InsertTab();
void genTrac42RemoveTab();
void genTrac42NewLine();


// functions to iterate through AST
void genTrac42Program(t_tree node);
void genTrac42Function(t_tree node);
void genTrac42Formal(t_tree node, int first);
void genTrac42Local(t_tree node);
void genTrac42Variable(t_tree node, int first, vKind varkind);
void genTrac42Assign(t_tree node);
void genTrac42If(t_tree node);
void genTrac42While(t_tree node);
void genTrac42Loop(t_tree node);
void genTrac42Exit(t_tree node);
void genTrac42Asm(t_tree node);
void genTrac42Return(t_tree node);
void genTrac42FuncCallStmnt(t_tree node);
void genTrac42FuncCallExpr(t_tree node);
void genTrac42Actual(t_tree node, int first);
void genTrac42Unary(t_tree node);
void genTrac42Binary(t_tree node);
void genTrac42IntConst(t_tree node);
void genTrac42BoolConst(t_tree node);
void genTrac42FloatConst(t_tree node);
void genTrac42CompValue(t_tree node);
void genTrac42VecValue(t_tree node);
void genTrac42MatValue(t_tree node);
void genTrac42RValue(t_tree node);
void genTrac42LValue(t_tree node);

// increases tabindex
void genTrac42InsertTab()
{
	genTrac42TabIndex++;
}

// decreases tabindex
void genTrac42RemoveTab()
{
	genTrac42TabIndex--;
}

// makes a line break and tabs in according to tab index
void genTrac42NewLine()
{
	int i = genTrac42TabIndex;
	fprintf(genTrac42FilePtr, "\n");
	while (i > 0)
	{
		fprintf(genTrac42FilePtr, "\t");
		i--;
	}
}

// generic function for handling statements in AST
void genTrac42Stmnt(t_tree node)
{
	if (node == NULL)
		return;

	switch(node->Kind)
	{
	case kAssign:
		genTrac42Assign(node);
		break;
	case kIf:
		genTrac42If(node);
		break;
	case kWhile:
		genTrac42While(node);
		break;
	case kFuncCallStmnt:
		genTrac42FuncCallStmnt(node);
		break;
	case kReturn:
		genTrac42Return(node);
		break;
	case kLoop:
		genTrac42Loop(node);
		break;
	case kExit:
		genTrac42Exit(node);
		break;
	case kAsm:
		genTrac42Asm(node);
		break;
	default:
		// error
		fprintf(genTrac42FilePtr, "error ");
		break;		
	}
}

// generic function to handle expressions in AST
void genTrac42Expr(t_tree node)
{
	switch(node->Kind)
	{
	case kUnary:
		genTrac42Unary(node);
		break;
	case kBinary:
		genTrac42Binary(node);
		break;
	case kIntConst:
		genTrac42IntConst(node);
		break;
	case kBoolConst:
		genTrac42BoolConst(node);
		break;
	case kFloatConst:
		genTrac42FloatConst(node);
		break;
	case kVecValue:
		genTrac42VecValue(node);
		break;
	case kMatValue:
		genTrac42MatValue(node);
		break;
	case kFuncCallExpr:
		genTrac42FuncCallExpr(node);
		break;
	case kRValue:
		genTrac42RValue(node);
		break;
	case kLValue:
		genTrac42LValue(node);
		break;
	case kCompValue:
		genTrac42CompValue(node);
		break;
	default:
		// error
		fprintf(genTrac42FilePtr, "error ");
		break;		
	}
}

// handes the root of the AST
void genTrac42Program(t_tree node)
{
	genTrac42Function(node->Node.Program.Functions);
}

// handles variables of both kinds
void genTrac42Variable(t_tree node, int first, vKind varkind)
{
	if (node == NULL)
	{
		if (varkind == kFormal && first == 0)
			fprintf(genTrac42FilePtr, ")");
		return;
	}
	switch (node->Node.Variable.VarKind)
	{
	case kFormal:
		if (varkind == kFormal)
			genTrac42Formal(node, first);
		else
			genTrac42Variable(node->Node.Variable.Next, first, varkind);
		break;
	case kLocal:
		if (varkind == kLocal)
			genTrac42Local(node);
		else
			genTrac42Variable(node->Node.Variable.Next, first, varkind);
		break;
	}
}

// handles function bodies and calls the next function in the next-chain
void genTrac42Function(t_tree node)
{
	if (node == NULL)
		return;

	if (node->Node.Function.Type == VOID)
		fprintf(genTrac42FilePtr, "procedure ");
	else
		fprintf(genTrac42FilePtr, "function ");


	fprintf(genTrac42FilePtr, node->Node.Function.Name);

	genTrac42Variable(node->Node.Function.Variables, 1, kFormal);
	
	if (node->Node.Function.Type != VOID)
	{
		switch (node->Node.Function.Type)
		{	
		case BOOL:	
			fprintf(genTrac42FilePtr, "return boolean ");
			break;
		case FLOAT:
			fprintf(genTrac42FilePtr, "return float ");
			break;
		case INT:
			fprintf(genTrac42FilePtr, "return integer ");
			break;
		case VECTOR:
			fprintf(genTrac42FilePtr, "return vector ");
			break;
		case MATRIX:
			fprintf(genTrac42FilePtr, "return matrix ");
			break;
		default:
			// error
			fprintf(genTrac42FilePtr, "error ");
			break;
		}
	}

	fprintf(genTrac42FilePtr, " is ");



	genTrac42InsertTab();

	genTrac42Variable(node->Node.Function.Variables, 0, kLocal);

	genTrac42RemoveTab();
	genTrac42NewLine();

	fprintf(genTrac42FilePtr, "begin");

	genTrac42InsertTab();

	genTrac42Stmnt(node->Node.Function.Stmnts);

	genTrac42RemoveTab();
	genTrac42NewLine();

	fprintf(genTrac42FilePtr, "end ");
	fprintf(genTrac42FilePtr, node->Node.Function.Name);
	fprintf(genTrac42FilePtr, ";");

	genTrac42NewLine();
	genTrac42NewLine();

	genTrac42Function(node->Node.Function.Next);
}

// handles formal variables, 'first' is used to keep track of the first formal to get the commas right
void genTrac42Formal(t_tree node, int first)
{
	if (node == NULL)
		return;

	if (first == 1)
		fprintf(genTrac42FilePtr, "(");
	else
		fprintf(genTrac42FilePtr, "; ");	

	fprintf(genTrac42FilePtr, node->Node.Variable.Name);

	switch (node->Node.Variable.Type)
	{
	case BOOL:
		fprintf(genTrac42FilePtr, " : boolean");
		break;
	case INT:
		fprintf(genTrac42FilePtr, " : integer");
		break;
	case FLOAT:
		fprintf(genTrac42FilePtr, " : float");
		break;
	case VECTOR:
		fprintf(genTrac42FilePtr, " : vector");
		break;
	case MATRIX:
		fprintf(genTrac42FilePtr, " : matrix");
		break;
	case INT_ADDR:
		fprintf(genTrac42FilePtr, " : access(integer)");
		break;
	case FLOAT_ADDR:
		fprintf(genTrac42FilePtr, " : access(float)");
		break;
	case BOOL_ADDR:
		fprintf(genTrac42FilePtr, " : access(boolean)");
		break;
	case VECTOR_ADDR:
		fprintf(genTrac42FilePtr, " : access(vector)");
		break;
	case MATRIX_ADDR:
		fprintf(genTrac42FilePtr, " : access(matrix)");
		break;
	default:
		// error
		fprintf(genTrac42FilePtr, "error ");
		break;
	}

	
	genTrac42Variable(node->Node.Variable.Next, 0, kFormal);
}

// handles local variables
void genTrac42Local(t_tree node)
{
	if (node == NULL)
		return;

	genTrac42NewLine();
	fprintf(genTrac42FilePtr, node->Node.Variable.Name);

	switch (node->Node.Variable.Type)
	{
	case BOOL:
		fprintf(genTrac42FilePtr, " : boolean;");
		break;
	case INT:
		fprintf(genTrac42FilePtr, " : integer;");
		break;
	case FLOAT:
		fprintf(genTrac42FilePtr, " : float;");
		break;
	case VECTOR:
		fprintf(genTrac42FilePtr, " : vector;");
		break;
	case MATRIX:
		fprintf(genTrac42FilePtr, " : matrix;");
		break;
	case INT_ADDR:
		fprintf(genTrac42FilePtr, " : access(integer);");
		break;
	case FLOAT_ADDR:
		fprintf(genTrac42FilePtr, " : access(float);");
		break;
	case BOOL_ADDR:
		fprintf(genTrac42FilePtr, " : access(boolean);");
		break;
	case VECTOR_ADDR:
		fprintf(genTrac42FilePtr, " : access(vector);");
		break;
	case MATRIX_ADDR:
		fprintf(genTrac42FilePtr, " : access(matrix);");
		break;
	default:
		// error
		fprintf(genTrac42FilePtr, "error ");
		break;
	}

	genTrac42Variable(node->Node.Variable.Next, 0, kLocal);
}

// handles assign statements
void genTrac42Assign(t_tree node)
{
	genTrac42NewLine();
	fprintf(genTrac42FilePtr, node->Node.Assign.Id);
	fprintf(genTrac42FilePtr, " := ");
	genTrac42Expr(node->Node.Assign.Expr);
	fprintf(genTrac42FilePtr, ";");
	genTrac42Stmnt(node->Node.Stmnt.Next);
}

// handles if statements
void genTrac42If(t_tree node)
{
	genTrac42NewLine();
	fprintf(genTrac42FilePtr, "if ");
	genTrac42Expr(node->Node.If.Expr);

	genTrac42InsertTab();
	genTrac42Stmnt(node->Node.If.Then);
	genTrac42RemoveTab();

	if (node->Node.If.Else != NULL)
	{
		genTrac42NewLine();
		fprintf(genTrac42FilePtr, "else");

		genTrac42InsertTab();
		genTrac42Stmnt(node->Node.If.Else);
		genTrac42RemoveTab();
	}

	genTrac42NewLine();
	fprintf(genTrac42FilePtr, "end if;");	
	genTrac42Stmnt(node->Node.Stmnt.Next);
}

// handles while statements
void genTrac42While(t_tree node)
{
	genTrac42NewLine();
	fprintf(genTrac42FilePtr, "while ");
	genTrac42Expr(node->Node.While.Expr);
	fprintf(genTrac42FilePtr, " loop");	

	genTrac42InsertTab();
	genTrac42Stmnt(node->Node.While.Stmnt);
	genTrac42RemoveTab();

	genTrac42NewLine();
	fprintf(genTrac42FilePtr, "end loop;");	

	genTrac42Stmnt(node->Node.Stmnt.Next);
}

// handles loop statements
void genTrac42Loop(t_tree node)
{
	genTrac42NewLine();
	fprintf(genTrac42FilePtr, "loop");

	genTrac42InsertTab();
	genTrac42Stmnt(node->Node.Loop.Stmnt);
	genTrac42RemoveTab();

	genTrac42NewLine();
	fprintf(genTrac42FilePtr, "end loop;");	

	genTrac42Stmnt(node->Node.Stmnt.Next);
}


// handles exit statements
void genTrac42Exit(t_tree node)
{
	genTrac42NewLine();
	fprintf(genTrac42FilePtr, "exit;");

	genTrac42Stmnt(node->Node.Stmnt.Next);
}

// handles asm statements
void genTrac42Asm(t_tree node)
{
	genTrac42NewLine();
	fprintf(genTrac42FilePtr, "smc(");
	fprintf(genTrac42FilePtr, node->Node.Asm.Arg);
	fprintf(genTrac42FilePtr, ");");

	genTrac42Stmnt(node->Node.Stmnt.Next);
}



// handles return statements
void genTrac42Return(t_tree node)
{
	genTrac42NewLine();
	if (node->Node.Return.Expr != NULL)
	{
		fprintf(genTrac42FilePtr, "return ");
		genTrac42Expr(node->Node.Return.Expr);
		fprintf(genTrac42FilePtr, ";");
	}
	else
		fprintf(genTrac42FilePtr, "return;");

	genTrac42Stmnt(node->Node.Stmnt.Next);
}

// handles function call statements
void genTrac42FuncCallStmnt(t_tree node)
{
	genTrac42NewLine();
	fprintf(genTrac42FilePtr, node->Node.FuncCallStmnt.FuncName);
	fprintf(genTrac42FilePtr, "(");

	genTrac42Actual(node->Node.FuncCallStmnt.Actuals, 1);
	fprintf(genTrac42FilePtr, ");");
	genTrac42Stmnt(node->Node.Stmnt.Next);
}

// handles function call expressions
void genTrac42FuncCallExpr(t_tree node)
{
	fprintf(genTrac42FilePtr, node->Node.FuncCallExpr.FuncName);
	fprintf(genTrac42FilePtr, "(");

	genTrac42Actual(node->Node.FuncCallExpr.Actuals, 1);
	fprintf(genTrac42FilePtr, ")");
}

// handles the actual function arguments for funccallexpr/funccallstmnt
// 'first' is used to keep track of first argument to get the commas right
void genTrac42Actual(t_tree node, int first)
{
	if (node == NULL)
		return;

	if (first == 0)
		fprintf(genTrac42FilePtr, ", ");

	genTrac42Expr(node->Node.Actual.Expr);
	genTrac42Actual(node->Node.Actual.Next, 0);
}

// handles unary expressions
void genTrac42Unary(t_tree node)
{
	switch(node->Node.Unary.Operator)
	{
	case NEG:
		fprintf(genTrac42FilePtr, "-(");
		break;
	case NOT:
		fprintf(genTrac42FilePtr, "not(");
		break;
	case FLOATOP:
		fprintf(genTrac42FilePtr, "float(");
		break;
	case INTOP:
		fprintf(genTrac42FilePtr, "integer(");
		break;		
	case SIN:
		fprintf(genTrac42FilePtr, "sin(");
		break;
	case ASIN:
		fprintf(genTrac42FilePtr, "arcsin(");
		break;
	case COS:
		fprintf(genTrac42FilePtr, "cos(");
		break;
	case ACOS:
		fprintf(genTrac42FilePtr, "arccos(");
		break;
	case ABS:
		fprintf(genTrac42FilePtr, "abs(");
		break;
	case SQRT:
		fprintf(genTrac42FilePtr, "sqrt(");
		break;
	default:
		fprintf(genTrac42FilePtr, "error");
		break;
	}
	genTrac42Expr(node->Node.Unary.Expr);
	fprintf(genTrac42FilePtr, ")");
}

// handles binary expressions
void genTrac42Binary(t_tree node)
{
	fprintf(genTrac42FilePtr, "(");
	genTrac42Expr(node->Node.Binary.LeftOperand);

	switch (node->Node.Binary.Operator)
	{
	case SUB:
		fprintf(genTrac42FilePtr, " - ");
		break;
	case PLUS:
		fprintf(genTrac42FilePtr, " + ");
		break;
	case MULT:
		fprintf(genTrac42FilePtr, " * ");
		break;
	case DIV:
		fprintf(genTrac42FilePtr, " / ");
		break;
	case OR:
		fprintf(genTrac42FilePtr, " or ");
		break;
	case AND:
		fprintf(genTrac42FilePtr, " and ");
		break;
	case EQ:
		fprintf(genTrac42FilePtr, " == ");
		break;
	case LT:
		fprintf(genTrac42FilePtr, " < ");
		break;
	case LE:
		fprintf(genTrac42FilePtr, " <= ");
		break;
	case MT:
		fprintf(genTrac42FilePtr, " > ");
		break;
	case ME:
		fprintf(genTrac42FilePtr, " >= ");
		break;
	default:
		fprintf(genTrac42FilePtr, " error ");
		break;
	}

	genTrac42Expr(node->Node.Binary.RightOperand);
	fprintf(genTrac42FilePtr, ")");
}

// handles int consts
void genTrac42IntConst(t_tree node)
{
	fprintf(genTrac42FilePtr, "%d", node->Node.IntConst.Value);
}

// handles bool consts
void genTrac42BoolConst(t_tree node)
{
	fprintf(genTrac42FilePtr, node->Node.BoolConst.Value);
}

// handles float consts
void genTrac42FloatConst(t_tree node)
{
	fprintf(genTrac42FilePtr, "%f", node->Node.FloatConst.Value);
}

// handles vector values
void genTrac42VecValue(t_tree node)
{
	fprintf(genTrac42FilePtr, "[");
	genTrac42Expr(node->Node.VecValue.Values[0]);
	fprintf(genTrac42FilePtr, ", ");
	genTrac42Expr(node->Node.VecValue.Values[1]);
	fprintf(genTrac42FilePtr, ", ");
	genTrac42Expr(node->Node.VecValue.Values[2]);
	fprintf(genTrac42FilePtr, "]");
}

// handles vector values
void genTrac42MatValue(t_tree node)
{
	fprintf(genTrac42FilePtr, "[");

	fprintf(genTrac42FilePtr, "[");
	genTrac42Expr(node->Node.MatValue.Values[0]);
	fprintf(genTrac42FilePtr, ", ");
	genTrac42Expr(node->Node.MatValue.Values[1]);
	fprintf(genTrac42FilePtr, ", ");
	genTrac42Expr(node->Node.MatValue.Values[2]);
	fprintf(genTrac42FilePtr, "], ");

	fprintf(genTrac42FilePtr, "[");
	genTrac42Expr(node->Node.MatValue.Values[3]);
	fprintf(genTrac42FilePtr, ", ");
	genTrac42Expr(node->Node.MatValue.Values[4]);
	fprintf(genTrac42FilePtr, ", ");
	genTrac42Expr(node->Node.MatValue.Values[5]);
	fprintf(genTrac42FilePtr, "], ");

	fprintf(genTrac42FilePtr, "[");
	genTrac42Expr(node->Node.MatValue.Values[6]);
	fprintf(genTrac42FilePtr, ", ");
	genTrac42Expr(node->Node.MatValue.Values[7]);
	fprintf(genTrac42FilePtr, ", ");
	genTrac42Expr(node->Node.MatValue.Values[8]);
	fprintf(genTrac42FilePtr, "]");

	fprintf(genTrac42FilePtr, "]");
}


void genTrac42LValue(t_tree node)
{
	fprintf(genTrac42FilePtr, "access(");
	fprintf(genTrac42FilePtr, node->Node.LValue.Id);
	fprintf(genTrac42FilePtr, ")");
}


void genTrac42RValue(t_tree node)
{
	fprintf(genTrac42FilePtr, node->Node.RValue.Id);
}

void genTrac42CompValue(t_tree node)
{
	if (node->Node.CompValue.type == VECTOR)
	{
		fprintf(genTrac42FilePtr, "%s.%s", node->Node.CompValue.Id, (node->Node.CompValue.iComp == 1 ? "X" : (node->Node.CompValue.iComp == 2 ? "Y" : "Z")));		
	}
	else if (node->Node.CompValue.type == MATRIX)
	{
		fprintf(genTrac42FilePtr, "%s.%sVector", node->Node.CompValue.Id, (node->Node.CompValue.iComp == 1 ? "X" : (node->Node.CompValue.iComp == 2 ? "Y" : "Z")));		
	}
	else
		fprintf(genTrac42FilePtr, "error");
}

// global function for traversing the AST and generating code
void genTrac42Traverse(t_tree node)
{
	genTrac42TabIndex = 0;

	genTrac42FilePtr = fopen("generatedcode.t42","w");
	if (genTrac42FilePtr != NULL)
	{
		genTrac42Program(node);
		fclose(genTrac42FilePtr);
	}
	else
	{
		// error
		printf("\nError genTrac42: Couldn't open file.\n");
	}
	
}
