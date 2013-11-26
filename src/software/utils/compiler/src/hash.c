/* Contains a generic hash table using chaining and the djb2 hash function originally
   invented by Dan Bernstein. */

#include "hash.h"
#include "array.h"
#include "llist.h"
#include "utils.h"

#include <stdlib.h>
#include <string.h>

#define MIN_POW2_SIZE 16

typedef struct t_entry t_entry;
typedef struct t_in_pair t_in_pair;

struct t_hash_table {
   /* The hash table as an array of bins. The elements of the array are linked lista whose elements are t_entry. */
   t_array *bins;

   /* The number of inserted elements. */
   unsigned nr_of_inserted_elements;

   /* The size of the table (nr of bins). */
   unsigned size;
};

/* This wraps the user data together with the key. */
struct t_entry {
   /* A pointer to the user provided key. */
   const char *key;

   /* The length of the key. */
   int len;

   /* A pointer to the user provided data. */
   void *element;
};

static unsigned djb2_hash(t_hash_table *hash_table, const char *key)
{
   unsigned hash_key = 5381;
   while (*key) {
      hash_key = ((hash_key << 5) + hash_key) + (unsigned)(unsigned char)*key; /* hash_key*33 + *key */
      key++;
   }
   return hash_key % hash_table->size;
}

static void destroy_hash_entries(void *data)
{
   t_llist *hash_entry=data;

   if (hash_entry) {
      llist_destroy(hash_entry, free);
   }
}

/* I did some trails on checking the length of ther strings first (precalculated strings) but it turned out
   to add on costs instead of compairing the strings immediately for some inifiles with a likely content.
   This is because it occurs 3 or more clashes on the same hash key relatively seldom. */
static int equal_keys(const void *entry, const void *key)
{
   return strcmp(((t_entry*)entry)->key, key) == 0;
}

/* Retrieves a pointer to the hash_entry (i.e. the entry of the hash table) and a pointer to the stored
   entry (i.e. the wrapper to the data to be stored).
   Returns 1 if found, else 0. */
static int get_entry(t_hash_table *hash_table, const char *key, t_entry **entry, t_llist **hash_entry)
{
   unsigned hash_key;

   *entry = NULL;
   hash_key = djb2_hash(hash_table, key);
   *hash_entry = array_get_at(hash_table->bins, hash_key);
   if (*hash_entry) {
      *entry = llist_find(*hash_entry, equal_keys, key);
   }
   return *entry != NULL;
}

extern t_hash_table *hash_create(unsigned size)
{
   t_hash_table *hash_table;
   unsigned pow2size;

   for (pow2size = MIN_POW2_SIZE; pow2size <= size; pow2size++) {
      ;
   }
   size = pow2size + 1;
   hash_table = CALLOC(t_hash_table, 1);
   hash_table->bins = array_create(size);
   array_increase_nr_of_elements_to(hash_table->bins, size);
   hash_table->size = size;
   return hash_table;
}

extern void hash_destroy(t_hash_table *hash_table)
{
   array_destroy(hash_table->bins, destroy_hash_entries);
   free(hash_table);
}

extern int hash_insert(t_hash_table *hash_table, const char *key, void *element)
{
   t_llist *hash_entry;
   t_entry *entry;
   unsigned hash_key;
   int unique;

   entry = MALLOC(t_entry, 1);
   entry->key = key;
   entry->len = strlen(key);
   entry->element = element;

   hash_key = djb2_hash(hash_table, key);
   hash_entry = array_get_at(hash_table->bins, hash_key);
   if (hash_entry == NULL) {
      /* This is the first element: create a new empty linked list. */
      hash_entry = llist_create();
      array_set_at_index(hash_table->bins, hash_key, hash_entry);
      unique = 1;
   } else {
      unique = hash_retrieve(hash_table, key) == NULL;
   }
   if (unique) {
      llist_insert_last(hash_entry, entry);
      hash_table->nr_of_inserted_elements++;
   }
   return unique;
}

extern void *hash_retrieve(t_hash_table *hash_table, const char *key)
{
   t_llist *hash_entry;
   t_entry *entry;
   void *element = NULL;

   if (get_entry(hash_table, key, &entry, &hash_entry)) {
      element = entry->element;
   }
   return element;
}

extern int hash_remove(t_hash_table *hash_table, const char *key)
{
   t_llist *hash_entry;
   t_entry *entry;
   int ok = 0;

   if (get_entry(hash_table, key, &entry, &hash_entry)) {
      llist_remove(hash_entry, entry);
      hash_table->nr_of_inserted_elements--;
      ok = 1;
   }
   return ok;
}

extern unsigned hash_nr_of_inserted_elements(t_hash_table *hash_table)
{
   return hash_table->nr_of_inserted_elements;
}

extern unsigned hash_size(t_hash_table *hash_table)
{
   return hash_table->size;
}
