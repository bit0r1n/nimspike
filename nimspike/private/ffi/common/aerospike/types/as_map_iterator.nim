from as_orderedmap import as_orderedmap_iterator

const asMapIteratorHeader = "aerospike/as_map_iterator.h"

type
  as_map_iterator* {.importc: "union as_map_iterator_u", header: asMapIteratorHeader, union.} = object
    orderedmap*: as_orderedmap_iterator