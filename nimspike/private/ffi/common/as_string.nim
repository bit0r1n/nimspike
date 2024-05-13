import ../utils, as_val

const asStringHeader* = "aerospike/as_string.h"

type
  as_string* {.importc: "struct as_string_s", header: asStringHeader.} = object
    `_`*: as_val
    free*: bool
    value*: cstring
    len*: csize_t
  as_string_ptr* = ptr as_string

proc as_string_init*(str: as_string_ptr, value: cstring, free: bool): as_string_ptr {.importc, dynlib: getLibName().}
proc as_string_init_wlen*(str: as_string_ptr, value: cstring, len: csize_t, free: bool): as_string_ptr {.importc, dynlib: getLibName().}
proc as_string_new*(value: cstring, free: bool): as_string_ptr {.importc, dynlib: getLibName().}
proc as_string_new_wlen*(value: cstring, len: csize_t, free: bool): as_string_ptr {.importc, dynlib: getLibName().}
proc as_string_new_strdup*(value: cstring): as_string_ptr {.importc, dynlib: getLibName().}
proc as_string_destroy*(str: as_string_ptr): void {.importc, dynlib: getLibName().}

proc as_string_len*(str: as_string_ptr): csize_t {.importc, dynlib: getLibName().}
proc as_string_getorelse*(str: as_string_ptr, fallback: cstring): cstring {.importc, dynlib: getLibName().}
proc as_string_get*(str: as_string_ptr): cstring {.importc, dynlib: getLibName().}
proc as_string_tostring*(str: as_string_ptr): cstring {.importc, dynlib: getLibName().}
proc as_basename*(filename: as_string_ptr, path: cstring): cstring {.importc, dynlib: getLibName().}

proc as_string_toval*(str: as_string_ptr): as_val_ptr {.importc, dynlib: getLibName().}
proc as_string_fromval*(v: as_val_ptr): as_string_ptr {.importc, dynlib: getLibName().}

proc as_string_val_destroy*(v: as_val_ptr): void {.importc, dynlib: getLibName().}
proc as_string_val_hashcode*(v: as_val_ptr): uint32 {.importc, dynlib: getLibName().}
proc as_string_val_tostring*(v: as_val_ptr): cstring {.importc, dynlib: getLibName().}

proc as_strncpy*(trg, src: cstring, size: int): bool {.importc, dynlib: getLibName().}
