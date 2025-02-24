import ../../utils, types/as_val

var
  as_cmp_inf*, as_cmp_wildcard*: as_val

proc as_cmp_inf_val_destroy*(v: ptr as_val): void {.importc, dynlib: asLibName.}
proc as_cmp_wildcard_val_destroy*(v: ptr as_val): void {.importc, dynlib: asLibName.}

proc as_cmp_inf_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: asLibName.}
proc as_cmp_wildcard_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: asLibName.}

proc as_cmp_inf_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: asLibName.}
proc as_cmp_wildcard_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: asLibName.}