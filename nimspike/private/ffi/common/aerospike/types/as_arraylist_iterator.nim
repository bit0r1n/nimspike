import ../../../utils, as_val, as_iterator, as_arraylist

const asArrayListIteratorHeader* = "aerospike/as_arraylist_iterator.h"

type
  as_arraylist_iterator* {.importc: "struct as_arraylist_iterator_s", header: asArrayListIteratorHeader.} = object
    `_`*: as_iterator
    list*: ptr as_arraylist
    pos*: uint32

proc as_arraylist_iterator_init*(`iterator`: ptr as_arraylist_iterator, list: ptr as_arraylist): ptr as_arraylist_iterator {.importc, dynlib: asLibName.}
proc as_arraylist_iterator_new*(list: ptr as_arraylist): ptr as_arraylist_iterator {.importc, dynlib: asLibName.}
proc as_arraylist_iterator_destroy*(`iterator`: ptr as_arraylist_iterator): void {.importc, dynlib: asLibName.}

proc as_arraylist_iterator_has_next*(`iterator`: ptr as_arraylist_iterator): bool {.importc, dynlib: asLibName.}
proc as_arraylist_iterator_next*(`iterator`: ptr as_arraylist_iterator): ptr as_val {.importc, dynlib: asLibName.}