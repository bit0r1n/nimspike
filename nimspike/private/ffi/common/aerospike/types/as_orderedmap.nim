import ../../../utils, as_val, as_iterator, as_pair, as_map

const asOrderedMapHeader* = "aerospike/as_orderedmap.h"

type
  map_entry* {.importc: "struct map_entry_s", header: asOrderedMapHeader.} = object
    key*, value*: ptr as_val
  as_orderedmap* {.importc: "struct as_orderedmap_s", header: asOrderedMapHeader.} = object
    `_`*: as_map
    count*, capacity*: uint32
    table*: ptr map_entry
    hold_count*: uint32
    hold_table*: ptr map_entry
    hold_locations*: ptr uint32
  as_orderedmap_iterator* {.importc: "struct as_orderedmap_iterator_s", header: asOrderedMapHeader.} = object
    `_`*: as_iterator
    map*: ptr as_orderedmap
    ix: uint32
    pair: as_pair

proc as_orderedmap_init*(map: ptr as_orderedmap, capacity: uint32): ptr as_orderedmap {.importc, dynlib: asLibName.}
proc as_orderedmap_new*(capacity: uint32): ptr as_orderedmap {.importc, dynlib: asLibName.}
proc as_orderedmap_destroy*(map: ptr as_orderedmap): void {.importc, dynlib: asLibName.}

proc as_orderedmap_size*(map: ptr as_orderedmap): uint32 {.importc, dynlib: asLibName.}
proc as_orderedmap_get*(map: ptr as_orderedmap, key: ptr as_val): ptr as_val {.importc, dynlib: asLibName.}
proc as_orderedmap_set*(map: ptr as_orderedmap, key, val: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_orderedmap_clear*(map: ptr as_orderedmap): cint {.importc, dynlib: asLibName.}
proc as_orderedmap_remove*(map: ptr as_orderedmap, key: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_orderedmap_set_flags*(map: ptr as_orderedmap, flags: uint32): void {.importc, dynlib: asLibName.}

proc as_orderedmap_foreach*(map: ptr as_orderedmap, callback: as_map_foreach_callback, udata: pointer): bool {.importc, dynlib: asLibName.}
proc as_orderedmap_iterator_init*(it: ptr as_orderedmap_iterator, map: ptr as_orderedmap): ptr as_orderedmap_iterator {.importc, dynlib: asLibName.}
proc as_orderedmap_iterator_new*(map: ptr as_orderedmap): ptr as_orderedmap_iterator {.importc, dynlib: asLibName.}
proc as_orderedmap_iterator_destroy*(it: ptr as_orderedmap_iterator): void {.importc, dynlib: asLibName.}
proc as_orderedmap_iterator_has_next*(it: ptr as_orderedmap_iterator): bool {.importc, dynlib: asLibName.}
proc as_orderedmap_iterator_next*(it: ptr as_orderedmap_iterator): ptr as_val {.importc, dynlib: asLibName.}
