import ../utils, as_val

const asIntegerHeader* = "aerospike/as_integer.h"

type
  as_integer* {.importc: "struct as_integer_s", header: asIntegerHeader.} = object
    `_`*: as_val
    value*: int64

proc as_integer_init*(integer: ptr as_integer, value: int64): ptr as_integer {.importc, dynlib: getLibName().}
proc as_integer_new*(value: int64): ptr as_integer {.importc, dynlib: getLibName().}
proc as_integer_destroy*(integer: ptr as_integer): void {.importc, dynlib: getLibName().}

proc as_integer_getorelse*(integer: ptr as_integer, fallback: int64): int64 {.importc, dynlib: getLibName().}
proc as_integer_get*(integer: ptr as_integer): int64 {.importc, dynlib: getLibName().}
proc as_integer_toint*(integer: ptr as_integer): int64 {.importc, dynlib: getLibName().}

proc as_integer_toval*(integer: ptr as_integer): ptr as_val {.importc, dynlib: getLibName().}
proc as_integer_fromval*(v: ptr as_val): ptr as_integer {.importc, dynlib: getLibName().}

proc as_integer_val_destroy*(v: ptr as_val): void {.importc, dynlib: getLibName().}
proc as_integer_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: getLibName().}
proc as_integer_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: getLibName().}
