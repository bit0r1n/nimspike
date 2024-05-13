import as_status, utils

const asErrorHeader = "aerospike/as_error.h"

type
  as_error* {.importc: "struct as_error_s", header: asErrorHeader.} = object
    code*: as_status
    message*, `func`*, file*: cstring
    line*: uint32
    in_doubt*: bool
  as_error_ptr* = ptr as_error

proc as_error_init*(err: as_error_ptr): as_error_ptr {.importc, dynlib: getLibName().}
proc as_error_reset*(err: as_error_ptr): as_status {.importc, dynlib: getLibName().}
proc as_error_setall*(err: as_error_ptr, code: as_status, message, `func`, file: cstring, line: uint32): as_status {.importc, dynlib: getLibName().}
proc as_error_setallv*(err: as_error_ptr, code: as_status, `func`, file, cstring, line: uint32, fmt: cstring): as_status {.importc, varargs, dynlib: getLibName().}
proc as_error_set_in_doubt*(err: as_error_ptr, is_read: bool, command_sent_counter: uint32): void {.importc, dynlib: getLibName().}
proc as_error_copy*(trg, src: as_error_ptr): void {.importc, dynlib: getLibName().}
proc as_error_append*(err: as_error_ptr, str: cstring): void {.importc, dynlib: getLibName().}
proc as_error_string*(status: as_status): cstring {.importc, dynlib: getLibName().}