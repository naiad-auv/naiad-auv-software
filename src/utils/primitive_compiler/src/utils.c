#include "utils.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern char *dstrcpy(const char *s)
{
   char *buf;
   buf = MALLOC(char, strlen(s) + 1);
   strcpy(buf, s);
   return buf;
}

static void alloc_error_handler(int size)
{
   char buf[100];
   sprintf(buf, "Cannot allocate %d bytes of memory", size);
   error_message(buf);
   exit(-1);
}

extern void error_message(const char *message)
{
   fprintf(stderr, "%s\n", message);
}

extern void *utils_malloc(size_t size, const char *file_name, const char *function, int line_number)
{
   void *mem;

   mem = malloc(size);
   if (mem == NULL && size != 0) {
      alloc_error_handler(size);
   }
   return mem;
}

extern void *utils_realloc(void *oldmem, size_t newsize, const char *file_name, const char *function, int line_number)
{
   oldmem = realloc(oldmem, newsize);
   if (oldmem == NULL && newsize != 0) {
      alloc_error_handler(newsize);
   }
   return oldmem;
}

extern void *utils_calloc(size_t size, const char *file_name, const char *function, int line_number)
{
   void *mem;

   mem = calloc(1, size);
   if (mem == NULL && size != 0) {
      alloc_error_handler(size);
   }
   return mem;
}
