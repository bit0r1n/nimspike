import ../../../utils
from as_val import as_val

# const asNilHeader* = "aerospike/as_nil.h"

type as_nil = as_val

proc as_nil_val_destroy*(v: ptr as_val): void {.importc, dynlib: asLibName.}
proc as_nil_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: asLibName.}
proc as_nil_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: asLibName.}
