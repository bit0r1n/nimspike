import ../../../utils, as_val, as_list, as_integer, as_double, as_string, as_bytes, as_map

const asArrayListHeader* = "aerospike/as_arraylist.h"

type
  as_arraylist* {.importc: "struct as_arraylist_s", header: asArrayListHeader.} = object
    `_`*: as_list
    block_size*, capacity*, size*: uint32
    elements*: ptr UncheckedArray[ptr as_val]
    free*: bool
  as_arraylist_status* {.importc: "enum as_arraylist_status_e" header: asArrayListHeader.} = enum
    AS_ARRAYLIST_OK = 0
    AS_ARRAYLIST_ERR_ALLOC
    AS_ARRAYLIST_ERR_MAX
    AS_ARRAYLIST_ERR_INDEX

proc as_arraylist_inita*(list: ptr as_arraylist, n: uint32): ptr as_arraylist {.importc, dynlib: asLibName.}
proc as_arraylist_init*(list: ptr as_arraylist, capacity: uint32, block_size: uint32): ptr as_arraylist {.importc, dynlib: asLibName.}
proc as_arraylist_new*(capacity: uint32, block_size: uint32): ptr as_arraylist {.importc, dynlib: asLibName.}
proc as_arraylist_destroy*(list: ptr as_arraylist): void {.importc, dynlib: asLibName.}

proc as_arraylist_hashcode*(list: ptr as_arraylist): uint32 {.importc, dynlib: asLibName.}
proc as_arraylist_size*(list: ptr as_arraylist): uint32 {.importc, dynlib: asLibName.}

proc as_arraylist_concat*(list: ptr as_arraylist, list2: ptr as_arraylist): cint {.importc, dynlib: asLibName.}
proc as_arraylist_trim*(list: ptr as_arraylist, index: uint32): cint {.importc, dynlib: asLibName.}
proc as_arraylist_head*(list: ptr as_arraylist): ptr as_val {.importc, dynlib: asLibName.}
proc as_arraylist_tail*(list: ptr as_arraylist): ptr as_val {.importc, dynlib: asLibName.}
proc as_arraylist_drop*(list: ptr as_arraylist, n: uint32): ptr as_arraylist {.importc, dynlib: asLibName.}
proc as_arraylist_take*(list: ptr as_arraylist, n: uint32): ptr as_arraylist {.importc, dynlib: asLibName.}

proc as_arraylist_get*(list: ptr as_arraylist, index: uint32): ptr as_val {.importc, dynlib: asLibName.}
proc as_arraylist_get_int64*(list: ptr as_arraylist, index: uint32): int64 {.importc, dynlib: asLibName.}
proc as_arraylist_get_double*(list: ptr as_arraylist, index: uint32): cdouble {.importc, dynlib: asLibName.}
proc as_arraylist_get_str*(list: ptr as_arraylist, index: uint32): cstring {.importc, dynlib: asLibName.}
proc as_arraylist_get_integer*(list: ptr as_arraylist, index: uint32): ptr as_integer {.importc, dynlib: asLibName.}
proc as_arraylist_get_as_double*(list: ptr as_arraylist, index: uint32): ptr as_double {.importc, dynlib: asLibName.}
proc as_arraylist_get_string*(list: ptr as_arraylist, index: uint32): ptr as_string {.importc, dynlib: asLibName.}
proc as_arraylist_get_bytes*(list: ptr as_arraylist, index: uint32): ptr as_bytes {.importc, dynlib: asLibName.}
proc as_arraylist_get_list*(list: ptr as_arraylist, index: uint32): ptr as_list {.importc, dynlib: asLibName.}
proc as_arraylist_get_map*(list: ptr as_arraylist, index: uint32): ptr as_map {.importc, dynlib: asLibName.}

proc as_arraylist_set*(list: ptr as_arraylist, index: uint32, value: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_arraylist_set_int64*(list: ptr as_arraylist, index: uint32, value: int64): cint {.importc, dynlib: asLibName.}
proc as_arraylist_set_double*(list: ptr as_arraylist, index: uint32, value: cdouble): cint {.importc, dynlib: asLibName.}
proc as_arraylist_set_str*(list: ptr as_arraylist, index: uint32, value: cstring): cint {.importc, dynlib: asLibName.}
proc as_arraylist_set_integer*(list: ptr as_arraylist, index: uint32, value: ptr as_integer): cint {.importc, dynlib: asLibName.}
proc as_arraylist_set_as_double*(list: ptr as_arraylist, index: uint32, value: ptr as_double): cint {.importc, dynlib: asLibName.}
proc as_arraylist_set_string*(list: ptr as_arraylist, index: uint32, value: ptr as_string): cint {.importc, dynlib: asLibName.}
proc as_arraylist_set_bytes*(list: ptr as_arraylist, index: uint32, value: ptr as_bytes): cint {.importc, dynlib: asLibName.}
proc as_arraylist_set_list*(list: ptr as_arraylist, index: uint32, value: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_arraylist_set_map*(list: ptr as_arraylist, index: uint32, value: ptr as_map): cint {.importc, dynlib: asLibName.}

proc as_arraylist_insert*(list: ptr as_arraylist, index: uint32, value: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_arraylist_insert_int64*(list: ptr as_arraylist, index: uint32, value: int64): cint {.importc, dynlib: asLibName.}
proc as_arraylist_insert_double*(list: ptr as_arraylist, index: uint32, value: cdouble): cint {.importc, dynlib: asLibName.}
proc as_arraylist_insert_str*(list: ptr as_arraylist, index: uint32, value: cstring): cint {.importc, dynlib: asLibName.}
proc as_arraylist_insert_integer*(list: ptr as_arraylist, index: uint32, value: ptr as_integer): cint {.importc, dynlib: asLibName.}
proc as_arraylist_insert_as_double*(list: ptr as_arraylist, index: uint32, value: ptr as_double): cint {.importc, dynlib: asLibName.}
proc as_arraylist_insert_string*(list: ptr as_arraylist, index: uint32, value: ptr as_string): cint {.importc, dynlib: asLibName.}
proc as_arraylist_insert_bytes*(list: ptr as_arraylist, index: uint32, value: ptr as_bytes): cint {.importc, dynlib: asLibName.}
proc as_arraylist_insert_list*(list: ptr as_arraylist, index: uint32, value: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_arraylist_insert_map*(list: ptr as_arraylist, index: uint32, value: ptr as_map): cint {.importc, dynlib: asLibName.}

proc as_arraylist_append*(list: ptr as_arraylist, value: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_arraylist_append_int64*(list: ptr as_arraylist, value: int64): cint {.importc, dynlib: asLibName.}
proc as_arraylist_append_double*(list: ptr as_arraylist, value: cdouble): cint {.importc, dynlib: asLibName.}
proc as_arraylist_append_str*(list: ptr as_arraylist, value: cstring): cint {.importc, dynlib: asLibName.}
proc as_arraylist_append_integer*(list: ptr as_arraylist, value: ptr as_integer): cint {.importc, dynlib: asLibName.}
proc as_arraylist_append_as_double*(list: ptr as_arraylist, value: ptr as_double): cint {.importc, dynlib: asLibName.}
proc as_arraylist_append_string*(list: ptr as_arraylist, value: ptr as_string): cint {.importc, dynlib: asLibName.}
proc as_arraylist_append_bytes*(list: ptr as_arraylist, value: ptr as_bytes): cint {.importc, dynlib: asLibName.}
proc as_arraylist_append_list*(list: ptr as_arraylist, value: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_arraylist_append_map*(list: ptr as_arraylist, value: ptr as_map): cint {.importc, dynlib: asLibName.}

proc as_arraylist_prepend*(list: ptr as_arraylist, value: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_arraylist_prepend_int64*(list: ptr as_arraylist, value: int64): cint {.importc, dynlib: asLibName.}
proc as_arraylist_prepend_double*(list: ptr as_arraylist, value: cdouble): cint {.importc, dynlib: asLibName.}
proc as_arraylist_prepend_str*(list: ptr as_arraylist, value: cstring): cint {.importc, dynlib: asLibName.}
proc as_arraylist_prepend_integer*(list: ptr as_arraylist, value: ptr as_integer): cint {.importc, dynlib: asLibName.}
proc as_arraylist_prepend_as_double*(list: ptr as_arraylist, value: ptr as_double): cint {.importc, dynlib: asLibName.}
proc as_arraylist_prepend_string*(list: ptr as_arraylist, value: ptr as_string): cint {.importc, dynlib: asLibName.}
proc as_arraylist_prepend_bytes*(list: ptr as_arraylist, value: ptr as_bytes): cint {.importc, dynlib: asLibName.}
proc as_arraylist_prepend_list*(list: ptr as_arraylist, value: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_arraylist_prepend_map*(list: ptr as_arraylist, value: ptr as_map): cint {.importc, dynlib: asLibName.}

proc as_arraylist_remove*(list: ptr as_arraylist, index: uint32): cint {.importc, dynlib: asLibName.}

proc as_arraylist_foreach*(list: ptr as_arraylist, callback: as_list_foreach_callback, udata: pointer): bool {.importc, dynlib: asLibName.}