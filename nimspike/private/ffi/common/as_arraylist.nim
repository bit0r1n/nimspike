import ../utils, as_val, as_list

const asArrayListHeader* = "aerospike/as_arraylist.h"

type
  as_arraylist* {.importc: "struct as_arraylist_s", header: asArrayListHeader.} = object
    `_`*: as_list
    block_size*, capacity*, size*: uint32
    table*: ptr map_entry
    hold_count*: uint32
    hold_table*: ptr map_entry
    hold_locations*: ptr uint32
  as_orderedmap_iterator* {.importc: "struct as_orderedmap_iterator_s", header: asOrderedMapHeader.} = object
    `_`*: as_iterator
    map*: ptr as_orderedmap
    ix: uint32
    pair: as_pair

proc as_orderedmap_init*(map: ptr as_orderedmap, capacity: uint32): ptr as_orderedmap {.importc, dynlib: getLibName().}
proc as_orderedmap_new*(capacity: uint32): ptr as_orderedmap {.importc, dynlib: getLibName().}
proc as_orderedmap_destroy*(map: ptr as_orderedmap): void {.importc, dynlib: getLibName().}

proc as_orderedmap_size*(map: ptr as_orderedmap): uint32 {.importc, dynlib: getLibName().}
proc as_orderedmap_get*(map: ptr as_orderedmap, key: ptr as_val): ptr as_val {.importc, dynlib: getLibName().}
proc as_orderedmap_set*(map: ptr as_orderedmap, key, val: ptr as_val): cint {.importc, dynlib: getLibName().}
proc as_orderedmap_clear*(map: ptr as_orderedmap): cint {.importc, dynlib: getLibName().}
proc as_orderedmap_remove*(map: ptr as_orderedmap, key: ptr as_val): cint {.importc, dynlib: getLibName().}
proc as_orderedmap_set_flags*(map: ptr as_orderedmap, flags: uint32): void {.importc, dynlib: getLibName().}

proc as_orderedmap_foreach*(map: ptr as_orderedmap, callback: as_map_foreach_callback, udata: pointer): bool {.importc, dynlib: getLibName().}
proc as_orderedmap_iterator_init*(it: ptr as_orderedmap_iterator, map: ptr as_orderedmap): ptr as_orderedmap_iterator {.importc, dynlib: getLibName().}
proc as_orderedmap_iterator_new*(map: ptr as_orderedmap): ptr as_orderedmap_iterator {.importc, dynlib: getLibName().}
proc as_orderedmap_iterator_destroy*(it: ptr as_orderedmap_iterator): void {.importc, dynlib: getLibName().}
proc as_orderedmap_iterator_has_next*(it: ptr as_orderedmap_iterator): bool {.importc, dynlib: getLibName().}
proc as_orderedmap_iterator_next*(it: ptr as_orderedmap_iterator): ptr as_val {.importc, dynlib: getLibName().}
