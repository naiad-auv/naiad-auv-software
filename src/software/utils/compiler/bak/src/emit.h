/* $Id: emit.h 9 2007-10-25 12:37:14Z csg $ */
#ifndef _EMIT_H_
#define _EMIT_H_

typedef struct tCode tCode;
typedef struct tInstr tInstr;

tCode *code_buffer_create(void);
int code_buffer_print(struct tCode *code, const char *list_file);
void code_buffer_destroy(tCode *code);
void empty_file(const char *list_file);

tInstr *emit_link(tCode *code);
tInstr *emit_unlink(tCode *code);
tInstr *emit_rts(tCode *code);
tInstr *emit_decl(tCode *code, int n, const char *debug);
tInstr *emit_lval(tCode *code, int offset, const char *debug);
tInstr *emit_ass(tCode *code, eType t); /* Error at this line? - Ensure that ast.h is included prior to emit.h! */
tInstr *emit_brf(tCode *code);
tInstr *emit_bra(tCode *code);
tInstr *emit_bsr(tCode *code);
void set_address(tInstr *instr, int addr);
int get_address(tInstr *instr);
int get_next_address(tCode *code);
tInstr *emit_pop(tCode *code, int n);
tInstr *emit_read(tCode *code, eType t);
tInstr *emit_write(tCode *code, eType t);
tInstr *emit_not(tCode *code);
tInstr *emit_neg(tCode *code);
tInstr *emit_or(tCode *code);
tInstr *emit_and(tCode *code);
tInstr *emit_eq(tCode *code, eType t);
tInstr *emit_lt(tCode *code, eType t);
tInstr *emit_le(tCode *code, eType t);
tInstr *emit_add(tCode *code);
tInstr *emit_sub(tCode *code);
tInstr *emit_mult(tCode *code);
tInstr *emit_div(tCode *code);
tInstr *emit_push_string(tCode *code, const char *str);
tInstr *emit_push_int(tCode *code, int value);
tInstr *emit_push_bool(tCode *code, int x);
tInstr *emit_rval(tCode *code, eType t, int offset, const char *debug);
tInstr *emit_fun_label(tCode *code, const char *label);

/* Optional - to be used by extended assignments: */
tInstr *emit_deref(tCode *code, int size);
tInstr *emit_setoffset(tCode *code);
#define EMIT_OFFSET_REG 1
/* End of extended assignments. */

#define INT_SIZE      1
#define BOOL_SIZE     1
#define STRING_SIZE 100

#endif
