import ../utils, as_val

const asBooleanHeader* = "aerospike/as_boolean.h"

type
  as_boolean* {.importc: "struct as_boolean_s", header: asBooleanHeader.} = object
    `_`*: as_val
    value*: bool
  as_true* = as_boolean
  as_false* = as_boolean

proc as_boolean_init*(boolean: ptr as_boolean, value: bool): ptr as_boolean {.importc, dynlib: getLibName().}
proc as_boolean_new*(value: bool): ptr as_boolean {.importc, dynlib: getLibName().}
proc as_boolean_destroy*(boolean: ptr as_boolean): void {.importc, dynlib: getLibName().}

proc as_boolean_getorelse*(boolean: ptr as_boolean, fallback: bool): bool {.importc, dynlib: getLibName().}
proc as_boolean_get*(boolean: ptr as_boolean): bool {.importc, dynlib: getLibName().}
proc as_boolean_tobool*(boolean: ptr as_boolean): bool {.importc, dynlib: getLibName().}

proc as_boolean_toval*(boolean: ptr as_boolean): ptr as_val {.importc, dynlib: getLibName().}
proc as_boolean_fromval*(v: ptr as_val): ptr as_boolean {.importc, dynlib: getLibName().}

proc as_boolean_val_destroy*(v: ptr as_val): void {.importc, dynlib: getLibName().}
proc as_boolean_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: getLibName().}
proc as_boolean_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: getLibName().}
