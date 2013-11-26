#ifndef _ARRAY_H_
#define _ARRAY_H_

typedef struct t_array t_array;
typedef void * t_array_iterator;

/* The interface of an array. This is an array that can only contain pointers (the user's elements are pointers).
   It doesn't do very much, but one important feature is that it manages the memory.
   The iteration can alternatively be performed by use of the -- and ++ operators applied to the iterator in which case the iterator
   will however not be NULL when heading the end of the array.
   The data element is obtained by dereferencing the iterator.
   The iterators are bi-directional.
*/

/* Returns a pointer to a new empty array. If `alloc_size' is 0 then the array constructor will assume some reasonable
   initial size for pre-allocation (alloc_size has nothing to do with array_size() wich will always be 0 at return from `array_create'). */
t_array *array_create(unsigned alloc_size);

/* Destroys an array. If `user_data_destroy' is not NULL it will be applied to each element in the array. */
void array_destroy(t_array *array, void (*user_data_destroy)(void *data));

/* Removes the elements of `array'. If `user_data_destroy' is not NULL it will be applied to each element in the array. */
void array_clear(t_array *array, void (*user_data_destroy)(void *data));

/* Returns current size of the array. */
unsigned array_size(t_array *array);

/* Extend the nr of elements of the array to `nr_of_elements' if there is it not already at least that number. Eventual
new elements will be set to NULL. */
void array_increase_nr_of_elements_to(t_array *array, unsigned nr_of_elements);

/* Inserts the element `data' at the end of the `array'. */
void array_insert_last(t_array *array, void *data);

/* Inserts the element of the array `src' into the array `dest' as a sequence starting at `iterator', if `iterator' is
   pointing to an element within the array or at the end if it is NULL.
   The size of `dest' will increase with array_size(src). */
void array_insert_sequence_at(t_array *dest, const t_array *src, t_array_iterator *iterator);

/* Removes a sequence of elements from `array' starting at `iterator' with a lenght of `sequence_length'. If
   `user_data_destroy' is not NULL it will be callet once for each removed element. */
void array_remove_sequence_at(t_array *array, t_array_iterator *iterator, unsigned sequence_length, void (*user_data_destroy)(void *data));

/* Removes the element at the position given by `iterator'. */
void array_remove(t_array *array, t_array_iterator *iterator);

/* Returns the index of `iterator' in `array'. It will return 0 if the iterator is out of range. */
unsigned array_index_of_iterator(t_array *array, t_array_iterator *iterator);

/* Returns the element at `index' or NULL if index is out of range. */
void *array_get_at(t_array *array, unsigned index);

/* Changes the element at `index' to the value of `data' in case it is in range, else do nothing. */
void array_set_at_index(t_array *array, unsigned index, void *data);

/* Returns a pointer to an iterator starting at `index', or NULL if index is out of range. */
t_array_iterator *array_start_iteration_at(t_array *array, unsigned index);

/* Returns a pointer to an iterator pointing the first element of the array, or NULL if there are no elements. */
t_array_iterator *array_first(t_array *array);

/* Returns a pointer to an iterator immediately after `array_iterator', or NULL if array_iterator was the last. */
t_array_iterator *array_next(t_array *array, t_array_iterator *array_iterator);

/* Returns a pointer to an iterator pointing the last element of the array, or NULL if there are no elements. */
t_array_iterator *array_last(t_array *array);

/* Returns a pointer to an iterator immediately before `array_iterator', or NULL if array_iterator was the first. */
t_array_iterator *array_prev(t_array *array, t_array_iterator *array_iterator);

#endif
