import as_status, utils

const asErrorHeader = "aerospike/as_error.h"

type
  as_error* {.importc: "struct as_error_s", header: asErrorHeader.} = object
    code*: as_status
    message*, `func`*, file*: cstring
    line*: uint32
    in_doubt*: bool

proc as_error_init*(err: ptr as_error): ptr as_error {.importc, dynlib: asLibName.}
proc as_error_reset*(err: ptr as_error): as_status {.importc, dynlib: asLibName.}
proc as_error_setall*(err: ptr as_error, code: as_status, message, `func`, file: cstring, line: uint32): as_status {.importc, dynlib: asLibName.}
proc as_error_setallv*(err: ptr as_error, code: as_status, `func`, file, cstring, line: uint32, fmt: cstring): as_status {.importc, varargs, dynlib: asLibName.}
proc as_error_set_in_doubt*(err: ptr as_error, is_read: bool, command_sent_counter: uint32): void {.importc, dynlib: asLibName.}
proc as_error_copy*(trg, src: ptr as_error): void {.importc, dynlib: asLibName.}
proc as_error_append*(err: ptr as_error, str: cstring): void {.importc, dynlib: asLibName.}
proc as_error_string*(status: as_status): cstring {.importc, dynlib: asLibName.}