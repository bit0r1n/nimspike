import ../../../utils, as_val, as_integer, as_double, as_string, as_bytes, as_map

const asListHeader* = "aerospike/as_list.h"

type
  as_list_iterator* {.importc: "union as_list_iterator_u", header: asListHeader, union.} = object
  as_list_foreach_callback* = proc (value: ptr as_val, udata: pointer): bool {.cdecl.}
  as_list* {.importc: "struct as_list_s", header: asListHeader.} = object
    `_`*: as_val
    flags*: uint32
    hooks*: ptr as_list_hooks
  as_list_hooks* {.importc: "struct as_list_hooks_s", header: asListHeader.} = object
    destroy*: proc (list: ptr as_list): bool {.cdecl.}
    hashcode*: proc (list: ptr as_list): uint32 {.cdecl.}
    size*: proc (list: ptr as_list): uint32 {.cdecl.}

    get*: proc (list: ptr as_list, index: uint32): ptr as_val {.cdecl.}
    get_int64*: proc (list: ptr as_list, index: uint32): int64 {.cdecl.}
    get_double*: proc (list: ptr as_list, index: uint32): cdouble {.cdecl.}
    get_str*: proc (list: ptr as_list, index: uint32): cstring {.cdecl.}

    set*: proc (list: ptr as_list, index: uint32, value: ptr as_val): cint {.cdecl.}
    set_int64*: proc (list: ptr as_list, index: uint32, value: int64): cint {.cdecl.}
    set_double*: proc (list: ptr as_list, index: uint32, value: cdouble): cint {.cdecl.}
    set_str*: proc (list: ptr as_list, index: uint32, value: cstring): cint {.cdecl.}

    insert*: proc (list: ptr as_list, index: uint32, value: ptr as_val): cint {.cdecl.}
    insert_int64*: proc (list: ptr as_list, index: uint32, value: int64): cint {.cdecl.}
    insert_double*: proc (list: ptr as_list, index: uint32, value: cdouble): cint {.cdecl.}
    insert_str*: proc (list: ptr as_list, index: uint32, value: cstring): cint {.cdecl.}

    append*: proc (list: ptr as_list, value: ptr as_val): cint {.cdecl.}
    append_int64*: proc (list: ptr as_list, value: int64): cint {.cdecl.}
    append_double*: proc (list: ptr as_list, value: cdouble): cint {.cdecl.}
    append_str*: proc (list: ptr as_list, value: cstring): cint {.cdecl.}

    prepend*: proc (list: ptr as_list, value: ptr as_val): cint {.cdecl.}
    prepend_int64*: proc (list: ptr as_list, value: int64): cint {.cdecl.}
    prepend_double*: proc (list: ptr as_list, value: cdouble): cint {.cdecl.}
    prepend_str*: proc (list: ptr as_list, value: cstring): cint {.cdecl.}

    remove*: proc (list: ptr as_list, index: uint32): cint {.cdecl.}

    concat*: proc (list, list2: ptr as_list): cint {.cdecl.}
    trim*: proc (list: ptr as_list, index: uint32): cint {.cdecl.}
    head*: proc (list: ptr as_list): ptr as_val {.cdecl.}
    tail*: proc (list: ptr as_list): ptr as_val {.cdecl.}
    drop*: proc (list: ptr as_list, n: uint32): ptr as_list {.cdecl.}
    take*: proc (list: ptr as_list, n: uint32): ptr as_list {.cdecl.}

    foreach*: proc (list: ptr as_list, callback: as_list_foreach_callback, udata: pointer): bool {.cdecl.}
    iterator_new*: proc (list: ptr as_list): ptr as_list_iterator {.cdecl.}
    iterator_init*: proc (list: ptr as_list, it: ptr as_list_iterator): ptr as_list_iterator {.cdecl.}

proc as_list_cons*(list: ptr as_list, free: bool, hooks: ptr as_list_hooks): ptr as_list {.importc, dynlib: asLibName.}
proc as_list_init*(list: ptr as_list, hooks: ptr as_list_hooks): ptr as_list {.importc, dynlib: asLibName.}
proc as_list_new*(hooks: ptr as_list_hooks): ptr as_list {.importc, dynlib: asLibName.}
proc as_list_destroy*(list: ptr as_list): void {.importc, dynlib: asLibName.}

proc as_list_hashcode*(list: ptr as_list): uint32 {.importc, dynlib: asLibName.}
proc as_list_size*(list: ptr as_list): uint32 {.importc, dynlib: asLibName.}

proc as_list_concat*(list, list2: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_list_trim*(list: ptr as_list, index: uint32): cint {.importc, dynlib: asLibName.}
proc as_list_head*(list: ptr as_list): ptr as_val {.importc, dynlib: asLibName.}
proc as_list_tail*(list: ptr as_list): ptr as_val {.importc, dynlib: asLibName.}
proc as_list_drop*(list: ptr as_list, n: uint32): ptr as_list {.importc, dynlib: asLibName.}
proc as_list_take*(list: ptr as_list, n: uint32): ptr as_list {.importc, dynlib: asLibName.}

proc as_list_get*(list: ptr as_list, i: uint32): ptr as_val {.importc, dynlib: asLibName.}
proc as_list_get_int64*(list: ptr as_list, i: uint32): int64 {.importc, dynlib: asLibName.}
proc as_list_get_double*(list: ptr as_list, i: uint32): cdouble {.importc, dynlib: asLibName.}
proc as_list_get_str*(list: ptr as_list, i: uint32): cstring {.importc, dynlib: asLibName.}
proc as_list_get_integer*(list: ptr as_list, i: uint32): ptr as_integer {.importc, dynlib: asLibName.}
proc as_list_get_as_double*(list: ptr as_list, i: uint32): ptr as_double {.importc, dynlib: asLibName.}
proc as_list_get_string*(list: ptr as_list, i: uint32): ptr as_string {.importc, dynlib: asLibName.}
proc as_list_get_bytes*(list: ptr as_list, i: uint32): ptr as_bytes {.importc, dynlib: asLibName.}
proc as_list_get_list*(list: ptr as_list, i: uint32): ptr as_list {.importc, dynlib: asLibName.}
proc as_list_get_map*(list: ptr as_list, i: uint32): ptr as_map {.importc, dynlib: asLibName.}

proc as_list_set*(list: ptr as_list, i: uint32, val: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_list_set_int64*(list: ptr as_list, i: uint32, val: int64): cint {.importc, dynlib: asLibName.}
proc as_list_set_double*(list: ptr as_list, i: uint32, val: cdouble): cint {.importc, dynlib: asLibName.}
proc as_list_set_str*(list: ptr as_list, i: uint32, val: cstring): cint {.importc, dynlib: asLibName.}
proc as_list_set_integer*(list: ptr as_list, i: uint32, val: ptr as_integer): cint {.importc, dynlib: asLibName.}
proc as_list_set_as_double*(list: ptr as_list, i: uint32, val: ptr as_double): cint {.importc, dynlib: asLibName.}
proc as_list_set_string*(list: ptr as_list, i: uint32, val: ptr as_string): cint {.importc, dynlib: asLibName.}
proc as_list_set_bytes*(list: ptr as_list, i: uint32, val: ptr as_bytes): cint {.importc, dynlib: asLibName.}
proc as_list_set_list*(list: ptr as_list, i: uint32, val: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_list_set_map*(list: ptr as_list, i: uint32, val: ptr as_map): cint {.importc, dynlib: asLibName.}

proc as_list_insert*(list: ptr as_list, i: uint32, value: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_list_insert_int64*(list: ptr as_list, i: uint32, value: int64): cint {.importc, dynlib: asLibName.}
proc as_list_insert_double*(list: ptr as_list, i: uint32, value: cdouble): cint {.importc, dynlib: asLibName.}
proc as_list_insert_str*(list: ptr as_list, i: uint32, value: cstring): cint {.importc, dynlib: asLibName.}
proc as_list_insert_integer*(list: ptr as_list, i: uint32, value: ptr as_integer): cint {.importc, dynlib: asLibName.}
proc as_list_insert_as_double*(list: ptr as_list, i: uint32, value: ptr as_double): cint {.importc, dynlib: asLibName.}
proc as_list_insert_string*(list: ptr as_list, i: uint32, value: ptr as_string): cint {.importc, dynlib: asLibName.}
proc as_list_insert_bytes*(list: ptr as_list, i: uint32, value: ptr as_bytes): cint {.importc, dynlib: asLibName.}
proc as_list_insert_list*(list: ptr as_list, i: uint32, value: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_list_insert_map*(list: ptr as_list, i: uint32, value: ptr as_map): cint {.importc, dynlib: asLibName.}

proc as_list_append*(list: ptr as_list, value: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_list_append_int64*(list: ptr as_list, value: int64): cint {.importc, dynlib: asLibName.}
proc as_list_append_double*(list: ptr as_list, value: cdouble): cint {.importc, dynlib: asLibName.}
proc as_list_append_str*(list: ptr as_list, value: cstring): cint {.importc, dynlib: asLibName.}
proc as_list_append_integer*(list: ptr as_list, value: ptr as_integer): cint {.importc, dynlib: asLibName.}
proc as_list_append_as_double*(list: ptr as_list, value: ptr as_double): cint {.importc, dynlib: asLibName.}
proc as_list_append_string*(list: ptr as_list, value: ptr as_string): cint {.importc, dynlib: asLibName.}
proc as_list_append_bytes*(list: ptr as_list, value: ptr as_bytes): cint {.importc, dynlib: asLibName.}
proc as_list_append_list*(list: ptr as_list, value: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_list_append_map*(list: ptr as_list, value: ptr as_map): cint {.importc, dynlib: asLibName.}

proc as_list_prepend*(list: ptr as_list, value: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_list_prepend_int64*(list: ptr as_list, value: int64): cint {.importc, dynlib: asLibName.}
proc as_list_prepend_double*(list: ptr as_list, value: cdouble): cint {.importc, dynlib: asLibName.}
proc as_list_prepend_str*(list: ptr as_list, value: cstring): cint {.importc, dynlib: asLibName.}
proc as_list_prepend_integer*(list: ptr as_list, value: ptr as_integer): cint {.importc, dynlib: asLibName.}
proc as_list_prepend_as_double*(list: ptr as_list, value: ptr as_double): cint {.importc, dynlib: asLibName.}
proc as_list_prepend_string*(list: ptr as_list, value: ptr as_string): cint {.importc, dynlib: asLibName.}
proc as_list_prepend_bytes*(list: ptr as_list, value: ptr as_bytes): cint {.importc, dynlib: asLibName.}
proc as_list_prepend_list*(list: ptr as_list, value: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_list_prepend_map*(list: ptr as_list, value: ptr as_map): cint {.importc, dynlib: asLibName.}

proc as_list_remove*(list: ptr as_list, index: uint32): cint {.importc, dynlib: asLibName.}

proc as_list_foreach*(list: ptr as_list, callback: as_list_foreach_callback, udata: pointer): bool {.importc, dynlib: asLibName.}
proc as_list_iterator_new*(list: ptr as_list): ptr as_list_iterator {.importc, dynlib: asLibName.}
proc as_list_iterator_init*(it: ptr as_list_iterator, list: ptr as_list): ptr as_list_iterator {.importc, dynlib: asLibName.}

proc as_list_toval*(list: ptr as_list): ptr as_val {.importc, dynlib: asLibName.}
proc as_list_fromval*(v: ptr as_val): ptr as_list {.importc, dynlib: asLibName.}

proc as_list_val_destroy*(v: ptr as_val): void {.importc, dynlib: asLibName.}
proc as_list_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: asLibName.}
proc as_list_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: asLibName.}
