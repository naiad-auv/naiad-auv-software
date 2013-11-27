/* $Id: llist.h 88 2007-12-19 10:14:01Z csg $ */
#ifndef _LLIST_H_
#define _LLIST_H_

typedef struct t_llist t_llist;
typedef struct t_record t_iterator;

/* Returns a pointer to an new created, empty linked list. */
t_llist *llist_create(void);

/* Will free all memory related to the linked list `l'. If `user_data_destroy' is not NULL it will be called once for
   each data element in the linked list. */
void llist_destroy(t_llist *l, void (*user_data_destroy)(void *data));

/* Insert the element `data' first in the list `l'. */
void llist_insert_first(t_llist *l, void *data);

/* Insert the element `data' last in the list `l'. */
void llist_insert_last(t_llist *l, void *data);

/* Insert the element `data' before the location of `where' in the list `l'. If `where' is not found, then `data' will be
   inserted first. */
void llist_insert_at(t_llist *l, void *data, void *where);

/* 'llist_concatenate' concatenates the list l1 and l2. After the call l2 is no longer a valid pointer, and all its former
   elements are contained in l1. The element order is preserved. The elements from l2 are apppended at end of those in l1 */
void llist_concatenate(t_llist *l1, t_llist *l2);

/* Returns a bi-directional iterator to the first element in the list `l'. */
t_iterator *llist_first(t_llist *l);

/* Returns a bi-directional iterator to the last element in the list `l'. */
t_iterator *llist_last(t_llist *l);

/* Returns the next iterator of the list where the iterator `it' belongs. If `it' refers to the last element in ths list
   then it will return NULL. */
t_iterator *llist_next(t_iterator *it);

/* Returns the previous iterator of the list where the iterator `it' belongs. If `it' refers to the first element in ths list
   then it will return NULL. */
t_iterator *llist_prev(t_iterator *it);

/* Removes an element refered by the iterator `it' in the list `l'. The return value is an iterator refering to the next
   element in the list or NULL if this was the last element. */
t_iterator *llist_remove_at(t_llist *l, t_iterator *it);

/* Removes an element that contains the data pointer `data' if it exist, else do nothing. Returns non-0 if `data' existed. */
int llist_remove(t_llist *l, void *data);

/* Returns the data object in the list element refered by the iterator `it'. */
void *llist_data(t_iterator *it);

/* Returns a pointer to the data of the first element for which `compare' returns non-zero, or NULL if `compare' returns 0 for all
   elements it is applied to. I.e. `compare' shall return true for the matching element. */
void *llist_find(t_llist *l, int (*compare)(const void *list_data, const void *data), const void *data);

/* This function will call your function `call_back' for each element in the list `l' or until it returns 0.
   The first parameter to `call_back' is the data inserted in the list. The second parameter to `call_back'
   is the poiner `supplement', i.e. the same pointer in all calls. */
void llist_iterate(t_llist *l, int (*call_back)(void *list_data, void *supplement), void *supplement);

/* Returns the number of elements in the list `l'. */
int llist_size(t_llist *l);

#endif
