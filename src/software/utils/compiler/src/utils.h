#ifndef _UTILS_H_
#define _UTILS_H_

#include <stdlib.h>

/* Needed by the macros below. */
extern void *utils_malloc(size_t size, const char *file_name, const char *function, int line_number);
extern void *utils_realloc(void *oldmem, size_t newsize, const char *file_name, const char *function, int line_number);
extern void *utils_calloc(size_t size, const char *file_name, const char *function, int line_number);

/* Returns a pointer to a chunk of dynamically allocated memory of `nelem' number elements, each with
   the size of `type'. If no memory can be allocated it terminates the program with an errormessage
   telling where the problem is. */
#define MALLOC(type, nelem) (type*)utils_malloc((nelem)*sizeof(type), __FILE__, __FUNCTION__, __LINE__)

/* Like MALLOC but the returned memory is all set to 0. */
#define CALLOC(type, nelem) (type*)utils_calloc((nelem)*sizeof(type), __FILE__, __FUNCTION__, __LINE__)

/* Reallocates memory previously allocated by MALLOC, CALLOC, REALLOC, malloc, calloc or realloc. */
#define REALLOC(type, p, nelem) (type*)utils_realloc(p, (nelem)*sizeof(type), __FILE__, __FUNCTION__, __LINE__)

/* Prints an error message to a suitable media. */
extern void error_message(const char *message);

/* Returns a pointer to a copy of the string `s' in dynamic allocated memory. */
extern char *dstrcpy(const char *s);

#endif
