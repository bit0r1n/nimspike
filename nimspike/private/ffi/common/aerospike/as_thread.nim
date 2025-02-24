const asThreadHeader = "aerospike/as_thread.h"

proc as_thread_set_name*(name: cstring): void {.importc, header: asThreadHeader.}
proc as_thread_set_name_index*(name: cstring, index: uint32): void {.importc, header: asThreadHeader.}
