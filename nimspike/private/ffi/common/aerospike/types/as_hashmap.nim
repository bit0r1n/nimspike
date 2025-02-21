import ../../../utils, as_orderedmap

type as_hashmap* = as_orderedmap

proc as_hashmap_init*(map: ptr as_hashmap, capacity: uint32): ptr as_hashmap {.importc, dynlib: asLibName.}
proc as_hashmap_new*(capacity: uint32): ptr as_hashmap {.importc, dynlib: asLibName.}
let as_hashmap_destroy* = as_orderedmap_destroy

let as_hashmap_size* = as_orderedmap_size
proc as_hashmap_hashcode*(map: ptr as_hashmap): uint32 {.importc, dynlib: asLibName.}

let
  as_hashmap_get* = as_orderedmap_get
  as_hashmap_set* = as_orderedmap_set
  as_hashmap_clear* = as_orderedmap_clear
  as_hashmap_remove* = as_orderedmap_remove
  as_hashmap_set_flags* = as_orderedmap_set_flags

  as_hashmap_foreach* = as_orderedmap_foreach
