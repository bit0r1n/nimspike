import ../../../utils, as_val

const asDoubleHeader* = "aerospike/as_double.h"

type
  as_double* {.importc: "struct as_double_s", header: asDoubleHeader.} = object
    `_`*: as_val
    value*: cdouble

proc as_double_init*(value_ptr: ptr as_double, value: cdouble): ptr as_double {.importc, dynlib: asLibName.}
proc as_double_new*(value: cdouble): ptr as_double {.importc, dynlib: asLibName.}
proc as_double_destroy*(value: ptr as_double): void {.importc, dynlib: asLibName.}

proc as_double_getorelse*(value: ptr as_double, fallback: cdouble): cdouble {.importc, dynlib: asLibName.}
proc as_double_get*(value: ptr as_double): cdouble {.importc, dynlib: asLibName.}

proc as_double_toval*(value: ptr as_double): ptr as_val {.importc, dynlib: asLibName.}
proc as_double_fromval*(v: ptr as_val): ptr as_double {.importc, dynlib: asLibName.}

proc as_double_val_destroy*(v: ptr as_val): void {.importc, dynlib: asLibName.}
proc as_double_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: asLibName.}
proc as_double_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: asLibName.}
