import ../../../utils, as_val

const asMapHeader* = "aerospike/as_map.h"

type
  as_map_foreach_callback* = proc (key, value: ptr as_val, udata: pointer): bool {.cdecl.}
  as_map_iterator* {.importc: "union as_map_iterator_u", header: asMapHeader, union.} = object
  as_map* {.importc: "struct as_map_s", header: asMapHeader.} = object
    `_`*: as_val
    flags*: uint32
    hooks*: ptr as_map_hooks
  as_map_hooks* {.importc: "struct as_map_hooks_s", header: asMapHeader.} = object
    destroy*: proc (map: ptr as_map): bool {.cdecl.}
    hashcode*: proc (map: ptr as_map): uint32 {.cdecl.}
    size*: proc (map: ptr as_map): uint32 {.cdecl.}
    set*: proc (map: ptr as_map, key, val: ptr as_val): int {.cdecl.}
    get*: proc (map: ptr as_map, key: ptr as_val): ptr as_val {.cdecl.}
    clear*: proc (map: ptr as_map): int {.cdecl.}
    remove*: proc (map: ptr as_map, key: ptr as_val): int {.cdecl.}
    set_flags*: proc (map: ptr as_map, flags: uint32): void {.cdecl.}
    foreach*: proc (map: ptr as_map, callback: as_map_foreach_callback, udata: pointer): bool {.cdecl.}
    iterator_new*: proc (map: ptr as_map): ptr as_map_iterator {.cdecl.}
    iterator_init*: proc (map: ptr as_map, it: ptr as_map_iterator): ptr as_map_iterator {.cdecl.}

proc as_map_cons*(map: ptr as_map, free: bool, flags: uint32, hooks: ptr as_map_hooks): ptr as_map {.importc, dynlib: asLibName.}
proc as_map_init*(map: ptr as_map, hooks: ptr as_map_hooks): ptr as_map {.importc, dynlib: asLibName.}
proc as_map_new*(hooks: ptr as_map_hooks): ptr as_map {.importc, dynlib: asLibName.}
proc as_map_destroy*(map: ptr as_map): void {.importc, dynlib: asLibName.}

proc as_map_hashcode*(map: ptr as_map): uint32 {.importc, dynlib: asLibName.}
proc as_map_size*(map: ptr as_map): uint32 {.importc, dynlib: asLibName.}

proc as_map_get*(map: ptr as_map, key: ptr as_val): ptr as_val {.importc, dynlib: asLibName.}
proc as_map_set*(map: ptr as_map, key: ptr as_val, val: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_map_clear*(map: ptr as_map): cint {.importc, dynlib: asLibName.}
proc as_map_remove*(map: ptr as_map, key: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_map_set_flags*(map: ptr as_map, flags: uint32): void {.importc, dynlib: asLibName.}

proc as_map_foreach*(map: ptr as_map, callback: as_map_foreach_callback, udata: pointer): bool {.importc, dynlib: asLibName.}
proc as_map_iterator_new*(map: ptr as_map): ptr as_map_iterator {.importc, dynlib: asLibName.}
proc as_map_iterator_init*(it: ptr as_map_iterator, map: ptr as_map): ptr as_map_iterator {.importc, dynlib: asLibName.}
proc as_map_toval*(map: ptr as_map): ptr as_val {.importc, dynlib: asLibName.}
proc as_map_fromval*(val: ptr as_val): ptr as_map {.importc, dynlib: asLibName.}

proc as_map_val_destroy*(val: ptr as_val): void {.importc, dynlib: asLibName.}
proc as_map_val_hashcode*(val: ptr as_val): uint32 {.importc, dynlib: asLibName.}
proc as_map_val_tostring*(val: ptr as_val): cstring {.importc, dynlib: asLibName.}