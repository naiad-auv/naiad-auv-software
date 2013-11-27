/* $Id: emit.c 10 2007-10-25 15:31:33Z csg $ */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "ast.h"
#include "emit.h"
#include "trac42.h"
#include "llist.h"

#define LINKi	     0
#define UNLINKi     1
#define RTSi	     2
#define DECLi       3
#define LVALi       4
#define ASSi        5
#define BRFi        6
#define BRAi        7
#define READi       8
#define WRITEi      9
#define BSRi       10
#define POPi       11
#define NOTi       12
#define NEGi       13
#define ORi        14
#define ANDi       15
#define EQi        16
#define LTi        17
#define LEi        18
#define SUBi       19
#define ADDi       20
#define MULTi      21
#define DIVi       22
#define PUSHi      23
#define RVALi      24
#define FUNLABELi  25
#define DEREFi     26
#define SETOFFSETi 27
#define LVALDi     28
#define RVALDi     29
#define END        30

#define CODE_START 2      /* 0 & 1 are reserved for code wrapper! */

#ifdef BUILD_TRAC42_INTERPRETER
void error_message(const char *);
#else
#define error_message(s) fprintf(stderr, s);
#endif

struct tInstr {
  int opcode;
  int osa;
  int type;
  int intval;
  int address;
  char strval[STRING_SIZE];
};

struct tCode {
   t_llist *l;
   int address;
};

static void format_instruction(tInstr *instr, char *s)
{
   if (instr->opcode!=FUNLABELi)
      s += sprintf(s,"%3d   ", instr->address);
   switch (instr->opcode) {
   case END:
      sprintf(s,"%s", "END");
      break;
   case FUNLABELi:
      sprintf(s,"%3d [%s]", instr->address, instr->strval);
      break;
   case LINKi:
      sprintf(s,"LINK");
      break;
   case UNLINKi:
      sprintf(s,"UNLINK");
      break;
   case RTSi:
      sprintf(s,"RTS");
      break;
   case DECLi:
      sprintf(s,"DECL %d", instr->osa);
      break;
   case LVALi:
      if (instr->osa == EMIT_OFFSET_REG) {
         sprintf(s,"LVAL (FP+OR)");
      } else {
         sprintf(s,"LVAL %d(FP)", instr->osa);
      }
      break;
   case ASSi:
      switch (instr->type) {
         case INT: sprintf(s,"ASSINT"); break;
         case BOOL: sprintf(s,"ASSBOOL"); break;
         case STRING: sprintf(s,"ASSSTRING"); break;
         default: sprintf(s," Unknown type for assign");
      }
      break;
   case BRFi:
      sprintf(s,"BRF %d", instr->osa);
      break;
   case BRAi:
      sprintf(s,"BRA %d", instr->osa);
      break;
   case READi:
      switch (instr->type) {
         case INT: sprintf(s,"READINT"); break;
         case BOOL: sprintf(s,"READBOOL"); break;
         case STRING: sprintf(s,"READSTRING"); break;
         default: sprintf(s," Unknown type for read");
      }
      break;
   case WRITEi:
      switch (instr->type) {
         case INT: sprintf(s,"WRITEINT"); break;
         case BOOL: sprintf(s,"WRITEBOOL"); break;
         case STRING: sprintf(s,"WRITESTRING"); break;
         default: sprintf(s," Unknown type for write");
      }
      break;
   case BSRi:
      sprintf(s,"BSR %d", instr->osa);
      break;
   case POPi:
      sprintf(s,"POP %d", instr->osa);
      break;
   case NOTi:
      sprintf(s,"NOT");
      break;
   case NEGi:
      sprintf(s,"NEG");
      break;
   case ORi:
      sprintf(s,"OR");
      break;
   case ANDi:
      sprintf(s,"AND");
      break;
   case EQi:
      switch (instr->type) {
         case INT: sprintf(s,"EQINT"); break;
         case BOOL: sprintf(s,"EQBOOL"); break;
         case STRING: sprintf(s,"EQSTRING"); break;
         default: sprintf(s," Unknown type for ==");
      }
      break;
   case LTi:
      switch (instr->type) {
         case INT: sprintf(s,"LTINT"); break;
         case BOOL: sprintf(s,"LTBOOL"); break;
         case STRING: sprintf(s,"LTSTRING"); break;
         default: sprintf(s," Unknown type for <");
      }
      break;
   case LEi:
      switch (instr->type) {
         case INT: sprintf(s,"LEINT"); break;
         case BOOL: sprintf(s,"LEBOOL"); break;
         case STRING: sprintf(s,"LESTRING"); break;
         default: sprintf(s," Unknown type for <=");
      }
      break;
   case SUBi:
      sprintf(s,"SUB");
      break;
   case ADDi:
      sprintf(s,"ADD");
      break;
   case MULTi:
      sprintf(s,"MULT");
      break;
   case DIVi:
      sprintf(s,"DIV");
      break;
   case PUSHi: {
      switch (instr->type) {
         case INT: sprintf(s,"PUSHINT %d", instr->intval); break;
         case BOOL: sprintf(s,"PUSHBOOL %s", instr->intval?"true":"false"); break;
         case STRING: sprintf(s,"PUSHSTRING %s", instr->strval); break;
         default: sprintf(s," Unknown type for push");
      }
      break;
   }
   case RVALi:
      if (instr->osa == EMIT_OFFSET_REG) {
         switch (instr->type) {
            case INT: sprintf(s,"RVALINT (FP+OR)"); break;
            case BOOL: sprintf(s,"RVALBOOL (FP+OR)"); break;
            case STRING: sprintf(s,"RVALSTRING (FP+OR)"); break;
            default: sprintf(s," Unknown type for rval");
         }
      } else {
         switch (instr->type) {
            case INT: sprintf(s,"RVALINT %d(FP)", instr->osa); break;
            case BOOL: sprintf(s,"RVALBOOL %d(FP)", instr->osa); break;
            case STRING: sprintf(s,"RVALSTRING %d(FP)", instr->osa); break;
            default: sprintf(s," Unknown type for rval");
         }
      }
      break;
   case DEREFi:
      sprintf(s,"DEREF %d", instr->osa);
      break;
   case SETOFFSETi:
      sprintf(s,"SETOFFSET");
      break;
   default:
      error_message("Unknown instruction.");
      exit (0);
   }
}

static void print_instruction(tInstr *instr, FILE *file)
{
   char s[1000];
   format_instruction(instr, s);
   fprintf(file, "%s\n", s);
}

void set_address(tInstr *instr, int addr)
{
  instr->osa = addr;
}

int get_address(tInstr *instr)
{
  return instr->address;
}

int get_next_address(tCode *code)
{
  return code->address;
}

static tInstr *emit_instr(tCode *code, int opcode, int osa, int data_type, int intval, const char *strval)
{
   tInstr *instr=calloc(sizeof(tInstr),1);
   if (instr == NULL) {
      error_message("Out of memory when creating instruction\n");
      exit(-1);
   }
   llist_insert_last(code->l, instr);
   instr->opcode = opcode;
   instr->osa = osa;
   instr->type = data_type;
   instr->intval = intval;
   instr->address = code->address++;
   if (strval) {
      strcpy(instr->strval, strval);
   } else {
      *instr->strval = 0;
   }
   return instr;
}

tInstr *emit_link(tCode *code)            {return emit_instr(code, LINKi, 0, 0, 0, 0); }
tInstr *emit_unlink(tCode *code)          {return emit_instr(code, UNLINKi, 0, 0, 0, 0); }
tInstr *emit_rts(tCode *code)             {return emit_instr(code, RTSi, 0, 0, 0, 0); }
tInstr *emit_decl(tCode *code, int n, const char *debug)     {return emit_instr(code, DECLi, n, 0, 0, debug); }
tInstr *emit_lval(tCode *code, int offset, const char *debug){return emit_instr(code, LVALi, offset, 0, 0, debug); }
tInstr *emit_ass(tCode *code, eType t)    {return emit_instr(code, ASSi, 0, t, 0, 0); }
tInstr *emit_brf(tCode *code)             {return emit_instr(code, BRFi, 0, 0, 0, 0); }
tInstr *emit_bra(tCode *code)             {return emit_instr(code, BRAi, 0, 0, 0, 0); }
tInstr *emit_bsr(tCode *code)             {return emit_instr(code, BSRi, 0, 0, 0, 0); }
tInstr *emit_pop(tCode *code, int n)      {return emit_instr(code, POPi, n, 0, 0, 0); }
tInstr *emit_read(tCode *code, eType t)   {return emit_instr(code, READi, 0, t, 0, 0); }
tInstr *emit_write(tCode *code, eType t)  {return emit_instr(code, WRITEi, 0, t, 0, 0); }
tInstr *emit_not(tCode *code)             {return emit_instr(code, NOTi, 0, 0, 0, 0); }
tInstr *emit_neg(tCode *code)             {return emit_instr(code, NEGi, 0, 0, 0, 0); }
tInstr *emit_or(tCode *code)              {return emit_instr(code, ORi, 0, 0, 0, 0); }
tInstr *emit_and(tCode *code)             {return emit_instr(code, ANDi, 0, 0, 0, 0); }
tInstr *emit_eq(tCode *code, eType t)     {return emit_instr(code, EQi, 0, t, 0, 0); }
tInstr *emit_lt(tCode *code, eType t)     {return emit_instr(code, LTi, 0, t, 0, 0); }
tInstr *emit_le(tCode *code, eType t)     {return emit_instr(code, LEi, 0, t, 0, 0); }
tInstr *emit_add(tCode *code)             {return emit_instr(code, ADDi, 0, 0, 0, 0); }
tInstr *emit_sub(tCode *code)             {return emit_instr(code, SUBi, 0, 0, 0, 0); }
tInstr *emit_mult(tCode *code)            {return emit_instr(code, MULTi, 0, 0, 0, 0); }
tInstr *emit_div(tCode *code)             {return emit_instr(code, DIVi, 0, 0, 0, 0); }
tInstr *emit_push_string(tCode *code, const char *str)  {return emit_instr(code, PUSHi, 0, STRING, 0, str); }
tInstr *emit_push_int(tCode *code, int x) {return emit_instr(code, PUSHi, 0, INT, x, 0); }
tInstr *emit_push_bool(tCode *code, int x){return emit_instr(code, PUSHi, 0, BOOL, x, 0); }
tInstr *emit_rval(tCode *code, eType t, int offset, const char *debug) {return emit_instr(code, RVALi, offset, t, 0, debug); }
tInstr *emit_fun_label(tCode *code, const char *label) {return emit_instr(code, FUNLABELi, 0, 0, 0, label); }
tInstr *emit_deref(tCode *code, int size) {return emit_instr(code, DEREFi, size, 0, 0, 0); }
tInstr *emit_setoffset(tCode *code)       {return emit_instr(code, SETOFFSETi, 0, 0, 0, 0); }

tCode *code_buffer_create(void)
{
   tCode *code = calloc(sizeof(tCode), 1);
   if (code == NULL) {
      error_message("Out of memory when creating code buffer\n");
      exit(-1);
   }
   code->l = llist_create();
   code->address = 2;
   return code;
}

void code_buffer_destroy(tCode *code)
{
   llist_destroy(code->l, free);
   free(code);
}

/* Old version
int code_buffer_print(tCode *code, const char *list_file, const char *obj_file)
{
   FILE *lfile, *ofile;
   int n;
   t_iterator *i;
   lfile = fopen(list_file, "w");
   if (lfile==NULL)
      return -1;
   ofile = fopen(obj_file, "w");
   if (ofile==NULL) {
      fclose(lfile);
      return -1;
   }

   for (i=llist_first(code->l); i; i=llist_next(i)) {
      print_instruction(llist_data(i), lfile);
   }

   fclose(lfile);
   for (i=llist_first(code->l); i; i=llist_next(i)) {
      n = fwrite (llist_data(i), sizeof (tInstr), 1, ofile);
      if (n==0) {
         fclose(ofile);
         return -1;
      }
   }
   fclose(ofile);
   return 0;
}
*/

int code_buffer_print(tCode *code, const char *list_file)
{
   FILE *lfile, *ofile;
   int n;
   t_iterator *i;

   lfile = fopen(list_file, "w");
   if (lfile==NULL)
      return -1;
   for (i=llist_first(code->l); i; i=llist_next(i)) {
      print_instruction(llist_data(i), lfile);
   }
   fclose(lfile);
   return 0;
}

/* Old version
void empty_files(const char *list_file, const char *obj_file)
{
   FILE *lfile, *ofile;
   ofile = fopen(obj_file, "w");
   if (ofile)
      fclose(ofile);
   lfile = fopen(list_file, "w");
   if (lfile)
      fclose(lfile);
}
*/

void empty_file(const char *list_file)
{
   FILE *lfile = fopen(list_file, "w");
   if (lfile)
      fclose(lfile);
}

#ifdef BUILD_TRAC42_INTERPRETER
#include "vm.C"
#endif
