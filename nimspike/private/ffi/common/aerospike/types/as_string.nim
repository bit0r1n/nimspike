import ../../../utils, as_val

const asStringHeader* = "aerospike/as_string.h"

type
  as_string* {.importc: "struct as_string_s", header: asStringHeader.} = object
    `_`*: as_val
    free*: bool
    value*: cstring
    len*: csize_t

proc as_string_init*(str: ptr as_string, value: cstring, free: bool): ptr as_string {.importc, dynlib: asLibName.}
proc as_string_init_wlen*(str: ptr as_string, value: cstring, len: csize_t, free: bool): ptr as_string {.importc, dynlib: asLibName.}
proc as_string_new*(value: cstring, free: bool): ptr as_string {.importc, dynlib: asLibName.}
proc as_string_new_wlen*(value: cstring, len: csize_t, free: bool): ptr as_string {.importc, dynlib: asLibName.}
proc as_string_new_strdup*(value: cstring): ptr as_string {.importc, dynlib: asLibName.}
proc as_string_destroy*(str: ptr as_string): void {.importc, dynlib: asLibName.}

proc as_string_len*(str: ptr as_string): csize_t {.importc, dynlib: asLibName.}
proc as_string_getorelse*(str: ptr as_string, fallback: cstring): cstring {.importc, dynlib: asLibName.}
proc as_string_get*(str: ptr as_string): cstring {.importc, dynlib: asLibName.}
proc as_string_tostring*(str: ptr as_string): cstring {.importc, dynlib: asLibName.}
proc as_basename*(filename: ptr as_string, path: cstring): cstring {.importc, dynlib: asLibName.}

proc as_string_toval*(str: ptr as_string): ptr as_val {.importc, dynlib: asLibName.}
proc as_string_fromval*(v: ptr as_val): ptr as_string {.importc, dynlib: asLibName.}

proc as_string_val_destroy*(v: ptr as_val): void {.importc, dynlib: asLibName.}
proc as_string_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: asLibName.}
proc as_string_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: asLibName.}

proc as_strncpy*(trg, src: cstring, size: int): bool {.importc, dynlib: asLibName.}
