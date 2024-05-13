import ../utils, as_val

const asIntegerHeader* = "aerospike/as_integer.h"

type
  as_integer* {.importc: "struct as_integer_s", header: asIntegerHeader.} = object
    `_`*: as_val
    value*: int64
  as_integer_ptr* = ptr as_integer

proc as_integer_init*(integer: as_integer_ptr, value: int64): as_integer_ptr {.importc, dynlib: getLibName().}
proc as_integer_new*(value: int64): as_integer_ptr {.importc, dynlib: getLibName().}
proc as_integer_destroy*(integer: as_integer_ptr): void {.importc, dynlib: getLibName().}

proc as_integer_getorelse*(integer: as_integer_ptr, fallback: int64): int64 {.importc, dynlib: getLibName().}
proc as_integer_get*(integer: as_integer_ptr): int64 {.importc, dynlib: getLibName().}
proc as_integer_toint*(integer: as_integer_ptr): int64 {.importc, dynlib: getLibName().}

proc as_integer_toval*(integer: as_integer_ptr): as_val_ptr {.importc, dynlib: getLibName().}
proc as_integer_fromval*(v: as_val_ptr): as_integer_ptr {.importc, dynlib: getLibName().}

proc as_integer_val_destroy*(v: as_val_ptr): void {.importc, dynlib: getLibName().}
proc as_integer_val_hashcode*(v: as_val_ptr): uint32 {.importc, dynlib: getLibName().}
proc as_integer_val_tostring*(v: as_val_ptr): cstring {.importc, dynlib: getLibName().}
