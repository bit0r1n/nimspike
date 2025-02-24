import as_arraylist_iterator

const asListIteratorHeader = "aerospike/as_list_iterator.h"

type
  as_list_iterator* {.importc: "union as_list_iterator_u", header: asListIteratorHeader, union.} = object
    arraylist*: as_arraylist_iterator