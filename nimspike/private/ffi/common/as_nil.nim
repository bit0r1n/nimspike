import ../utils
from as_val import as_val, as_val_type_e

# const asNilHeader* = "aerospike/as_nil.h"

type as_nil = as_val

proc as_nil_val_destroy*(v: ptr as_val): void {.importc, dynlib: getLibName().}
proc as_nil_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: getLibName().}
proc as_nil_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: getLibName().}
