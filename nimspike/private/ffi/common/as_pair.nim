import ../utils, as_val

const asPairHeader* = "aerospike/as_pair.h"

type
  as_pair* {.importc: "struct as_pair_s", header: asPairHeader.} = object
    `_`*: as_val
    first_v* {.importc: "_1".}: ptr as_val
    second_v* {.importc: "_2".}: ptr as_val

proc as_pair_init*(pair: ptr as_pair, first, second: ptr as_val): ptr as_pair {.importc, dynlib: getLibName().}
proc as_pair_new*(first, second: ptr as_val): ptr as_pair {.importc, dynlib: getLibName().}
proc as_pair_destroy*(pair: ptr as_pair): void {.importc, dynlib: getLibName().}

proc as_pair_1*(pair: ptr as_pair): ptr as_pair {.importc, dynlib: getLibName().}
proc as_pair_2*(pair: ptr as_pair): ptr as_pair {.importc, dynlib: getLibName().}

proc as_pair_toval*(boolean: ptr as_pair): ptr as_val {.importc, dynlib: getLibName().}
proc as_pair_fromval*(v: ptr as_val): ptr as_pair {.importc, dynlib: getLibName().}

proc as_pair_val_destroy*(v: ptr as_val): void {.importc, dynlib: getLibName().}
proc as_pair_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: getLibName().}
proc as_pair_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: getLibName().}
