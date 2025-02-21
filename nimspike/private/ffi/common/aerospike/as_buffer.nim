import ../../utils

const asBufferHeader* = "aerospike/as_buffer.h"

type
  as_buffer* {.importc: "struct as_buffer_s", header: asBufferHeader.} = object
    capacity*, size*: uint32
    data*: ptr uint8

proc as_buffer_init*(b: ptr as_buffer): ptr as_buffer {.importc, dynlib: asLibName.}
proc as_buffer_destroy*(b: ptr as_buffer): void {.importc, dynlib: asLibName.}