#ifndef HASH_H
#define HASH_H

typedef struct t_hash_table t_hash_table;

/* Returns a new hash table with `size' nr of bins. */
extern t_hash_table *hash_create(unsigned size);

/* Destroys `hash_table' and releases all memory that it is responsible for. */
extern void hash_destroy(t_hash_table *hash_table);

/* Insert `element' using the key `key' into this hash table. A pointer to `key' will be stored so the
   memory pointed to must persist as long as the element remains in the hash table. The caller is
   responsible for the memory pointed to by `key' and `element'.
   Returns 1 on success, else 0 (there is already an element with this key and this will not be stored. */
extern int hash_insert(t_hash_table *hash_table, const char *key, void *element);

/* Returns a pointer to the element with the key `key' if it exists, else NULL. The caller is
   responsible for the memory pointed to by `key'. */
extern void *hash_retrieve(t_hash_table *hash_table, const char *key);

/* Removes the element with `key' from this hash table. Returns 1 if the element exists, else 0. The caller is
   responsible for the memory pointed to by `key'. */
extern int hash_remove(t_hash_table *hash_table, const char *key);

/* Returns the number of inserted elements. */
extern unsigned hash_nr_of_inserted_elements(t_hash_table *hash_table);

/* Returns the size of the hash table. */
extern unsigned hash_size(t_hash_table *hash_table);

#endif
