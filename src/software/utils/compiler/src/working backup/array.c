/* array.c
   Contains a generic array. */

#include "array.h"
#include "utils.h"
#include <stdlib.h>

struct t_array {
   void **data;
   unsigned nr_of_elements;
   unsigned buffer_size;
};

t_array *array_create(unsigned size)
{
   t_array *array;
   array = CALLOC(t_array, 1);
   if (size) {
      array->buffer_size = size;
   } else {
      array->buffer_size = 64;
   }
   array->data = MALLOC(void*, array->buffer_size);
   return array;
}

static void extend_array_memory(t_array *array)
{
   array->buffer_size *= 2;
   array->data = REALLOC(void*, array->data, array->buffer_size);
}

void array_increase_nr_of_elements_to(t_array *array, unsigned size)
{
   unsigned prev_nr_of_elements, i;
   prev_nr_of_elements = array->nr_of_elements;
   if (size > prev_nr_of_elements) {
      array->nr_of_elements = size;
      while (array->nr_of_elements > array->buffer_size) {
         extend_array_memory(array);
      }
      for (i=prev_nr_of_elements; i<array->nr_of_elements; i++) {
         array->data[i] = NULL;
      }
   }
}

void array_clear(t_array *array, void (*user_data_destroy)(void *data))
{
   unsigned i;
   if (user_data_destroy) {
      for (i=0; i<array->nr_of_elements; i++) {
         user_data_destroy(array->data[i]);
      }
   }
   array->nr_of_elements = 0;
}

void array_destroy(t_array *array, void (*user_data_destroy)(void *data))
{
   array_clear(array, user_data_destroy);
   free(array->data);
   free(array);
}

void array_set_at_index(t_array *array, unsigned index, void *data)
{
   if (index < array->nr_of_elements) {
      array->data[index] = data;
   }
}

void array_insert_last(t_array *array, void *data)
{
   if (array->nr_of_elements >= array->buffer_size) {
      extend_array_memory(array);
   }
   array->data[array->nr_of_elements] = data;
   array->nr_of_elements++;
}

void array_insert_sequence_at(t_array *dest, const t_array *src, t_array_iterator *iterator)
{
   unsigned i, j, at_index;

   if (iterator == NULL) {
      at_index = dest->nr_of_elements;
   } else {
      at_index = iterator - dest->data;
   }
   if (at_index <= dest->nr_of_elements) {
      if (dest->nr_of_elements + src->nr_of_elements >= dest->buffer_size) {
         if (dest->nr_of_elements > src->nr_of_elements) {
            dest->buffer_size *= 2;
         } else {
            dest->buffer_size += src->nr_of_elements;
         }
         dest->data = REALLOC(void*, dest->data, dest->buffer_size);
      }

      /* Move away to make place. */
      for (i=dest->nr_of_elements+src->nr_of_elements-1, j=dest->nr_of_elements-1; j>=at_index; i--, j--) {
         dest->data[i] = dest->data[j];
      }

      /* Copy elements. */
      for (i=at_index, j=0; j<src->nr_of_elements; i++, j++) {
         dest->data[i] = src->data[j];
      }
      dest->nr_of_elements += src->nr_of_elements;
   }
}

void array_remove_sequence_at(t_array *array, t_array_iterator *iterator, unsigned sequence_length, void (*user_data_destroy)(void *data))
{
   unsigned i, j, at_index;
   at_index = iterator - array->data;
   for (i=at_index, j=at_index+sequence_length; j<array->nr_of_elements; i++) {
      if (user_data_destroy) {
         user_data_destroy(array->data[i]);
      }
      array->data[i] = array->data[j];
   }
   array->nr_of_elements -= sequence_length;
}

void array_remove(t_array *array, t_array_iterator *iterator)
{
   unsigned current_pos, i;
   current_pos = iterator - array->data;
   for (i=current_pos+1; i<array->nr_of_elements; i++) {
      array->data[i-1] = array->data[i];
   }
   array->nr_of_elements--;
}

unsigned array_size(t_array *array)
{
   return array->nr_of_elements;
}

void *array_get_at(t_array *array, unsigned index)
{
   void *data;
   if (index < array->nr_of_elements) {
      data = array->data[index];
   } else {
      data = NULL;
   }
   return data;
}

unsigned array_index_of_iterator(t_array *array, t_array_iterator *iterator)
{
   if (iterator >= array->data && iterator < array->data + array->nr_of_elements) {
      return iterator - array->data;
   } else {
      return 0;
   }
}

t_array_iterator *array_start_iteration_at(t_array *array, unsigned index)
{
   if (index < array->nr_of_elements) {
      return array->data + index;
   } else {
      return NULL;
   }
}

t_array_iterator *array_first(t_array *array)
{
   if (array->nr_of_elements > 0U) {
      return array->data;
   } else {
      return NULL;
   }
}

t_array_iterator *array_next(t_array *array, t_array_iterator *array_iterator)
{
   array_iterator++;
   if (array_iterator < array->data + array->nr_of_elements) {
      return array_iterator;
   } else {
      return NULL;
   }
}

t_array_iterator *array_last(t_array *array)
{
   if (array->nr_of_elements > 0U) {
      return array->data + array->nr_of_elements - 1;
   } else {
      return NULL;
   }
}

t_array_iterator *array_prev(t_array *array, t_array_iterator *array_iterator)
{
   if (array_iterator > array->data) {
      return array_iterator--;
   } else {
      return NULL;
   }
}
