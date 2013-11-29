/* $Id: llist.c 88 2007-12-19 10:14:01Z csg $ */
#include "llist.h"
#include "utils.h"
#include <stdlib.h>

typedef struct t_record t_record;

struct t_llist {
   struct t_record *first, *last;
   int n;
};

struct t_record {
   void *data;
   struct t_record *next, *prev;
};

/* --------- Local functions: */
static void destroy_records(t_record *r, void (*user_data_destroy)(void *data))
{
   if (r) {
      if (user_data_destroy) {
         user_data_destroy(r->data);
      }
      destroy_records(r->next, user_data_destroy);
      free(r);
   }
}

static t_record *make_record(t_llist *l, void *data)
{
   t_record *r;
   r = MALLOC(t_record, 1);
   r->data = data;
   r->next = r->prev = NULL;
   l->n++;
   return r;
}

static t_record *find_record(t_record *r, void *data)
{
   if (r==NULL || r->data == data)
      return r;
   return find_record(r->next, data);
}

/* --------- Exported functions: */
t_llist *llist_create(void)
{
   t_llist *l = CALLOC(t_llist, 1);
   return l;
}

void llist_destroy(t_llist *l, void (*user_data_destroy)(void *data))
{
   destroy_records(l->first, user_data_destroy);
   free(l);
}

void llist_insert_first(t_llist *l, void *data)
{
   t_record *r;
   r = make_record(l, data);
   if (l->first) {
      r->next = l->first;
      r->next->prev = r;
      l->first = r;
   } else
      l->first = l->last = r;
}

void llist_insert_last(t_llist *l, void *data)
{
   t_record *r;
   r = make_record(l, data);
   if (l->last) {
      r->prev = l->last;
      r->prev->next = r;
      l->last = r;
   } else
      l->first = l->last = r;
}

void llist_insert_at(t_llist *l, void *data, void *where)
{
   t_record *r, *nr;
   r = find_record(l->first, where);
   if (r) {
      if (r == l->first)
         return llist_insert_first(l, data);
      nr = make_record(l, data);
      nr->prev = r->prev;
      nr->next = r;
      nr->prev->next = nr;
      nr->next->prev = nr;
   } else
      llist_insert_first(l, data);
}

int llist_remove(t_llist *l, void *data)
{
   t_iterator *it;
   it = find_record(l->first, data);
   if (it==NULL) {
      return 0;
   } else {
      llist_remove_at(l, it);
      return 1;
   }
}

t_iterator *llist_remove_at(t_llist *l, t_iterator *it)
{
   t_iterator *next;
   next = it->next;
   if (it->prev)
      it->prev->next = it->next;
   else
      l->first = it->next;
   if (it->next)
      it->next->prev = it->prev;
   else
      l->last = it->prev;
   free(it);
   l->n--;
   return next;
}

void llist_concatenate(t_llist *l1, t_llist *l2)
{
   t_iterator *it;
   for (it=llist_first(l2); it; it = llist_next(it))
      llist_insert_last(l1, it->data);
   l1->n += l2->n;
   free(l2);
}

t_iterator *llist_first(t_llist *l)
{
   return l->first;
}

t_iterator *llist_last(t_llist *l)
{
   return l->last;
}

t_iterator *llist_next(t_iterator *it)
{
   return it->next;
}

t_iterator *llist_prev(t_iterator *it)
{
   return it->prev;
}

void *llist_data(t_iterator *it)
{
   return it->data;
}

void *llist_find(t_llist *l, int (*compare)(const void *list_data, const void *data), const void *data)
{
   t_iterator *it;
   void *appdata=NULL;

   for (it=l->first; it; it=it->next) {
      if (compare(it->data, data)) {
         appdata = it->data;
         break;
      }
   }
   return appdata;
}

void llist_iterate(t_llist *l, int (*call_back)(void *list_data, void *supplement), void *supplement)
{
   t_iterator *it;
   for (it=llist_first(l); it; it = llist_next(it)) {
      if (call_back(it->data, supplement) == 0) {
         break;
      }
   }
 }

int llist_size(t_llist *l)
{
   return l->n;
}

