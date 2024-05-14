import ../utils, as_val

const asResultHeader* = "aerospike/as_result.h"

type
  as_result* {.importc: "struct as_result_s", header: asResultHeader.} = object
    value*: as_val
    count*: uint32
    is_malloc*, is_success*: bool

proc as_result_init*(r: ptr as_result): ptr as_result {.importc, dynlib: getLibName().}
proc as_result_new*(): ptr as_result {.importc, dynlib: getLibName().}
proc as_result_reserve*(r: ptr as_result): ptr as_result {.importc, dynlib: getLibName().}

proc as_result_destroy*(pair: ptr as_result): void {.importc, dynlib: getLibName().}

proc as_success_new*(v: ptr as_val): ptr as_result {.importc, dynlib: getLibName().}
proc as_failure_new*(v: ptr as_val): ptr as_result {.importc, dynlib: getLibName().}

proc as_success_init*(r: ptr as_result, v: ptr as_val): ptr as_result {.importc, dynlib: getLibName().}
proc as_failure_init*(r: ptr as_result, v: ptr as_val): ptr as_result {.importc, dynlib: getLibName().}

proc as_result_value*(r: ptr as_result): ptr as_val {.importc, dynlib: getLibName().}

proc as_result_setsuccess*(r: ptr as_result, v: ptr as_val): ptr as_result {.importc, dynlib: getLibName().}
proc as_result_setfailure*(r: ptr as_result, v: ptr as_val): ptr as_result {.importc, dynlib: getLibName().}
