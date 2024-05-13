import ../utils, as_val

const asBooleanHeader* = "aerospike/as_boolean.h"

type
  as_boolean* {.importc: "struct as_boolean_s", header: asBooleanHeader.} = object
    `_`*: as_val
    value*: bool
  as_boolean_ptr* = ptr as_boolean
  as_true* = as_boolean
  as_false* = as_boolean

proc as_boolean_init*(boolean: as_boolean_ptr, value: bool): as_boolean_ptr {.importc, dynlib: getLibName().}
proc as_boolean_new*(value: bool): as_boolean_ptr {.importc, dynlib: getLibName().}
proc as_boolean_destroy*(boolean: as_boolean_ptr): void {.importc, dynlib: getLibName().}

proc as_boolean_getorelse*(boolean: as_boolean_ptr, fallback: bool): bool {.importc, dynlib: getLibName().}
proc as_boolean_get*(boolean: as_boolean_ptr): bool {.importc, dynlib: getLibName().}
proc as_boolean_tobool*(boolean: as_boolean_ptr): bool {.importc, dynlib: getLibName().}

proc as_boolean_toval*(boolean: as_boolean_ptr): as_val_ptr {.importc, dynlib: getLibName().}
proc as_boolean_fromval*(v: as_val_ptr): as_boolean_ptr {.importc, dynlib: getLibName().}

proc as_boolean_val_destroy*(v: as_val_ptr): void {.importc, dynlib: getLibName().}
proc as_boolean_val_hashcode*(v: as_val_ptr): uint32 {.importc, dynlib: getLibName().}
proc as_boolean_val_tostring*(v: as_val_ptr): cstring {.importc, dynlib: getLibName().}
