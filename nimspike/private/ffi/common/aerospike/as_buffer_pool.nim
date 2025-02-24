import ../../utils, ../citrusleaf/cf_queue

const asBufferPoolHeader = "aerospike/as_buffer_pool.h"

type
  as_buffer_result* {.importc: "struct as_buffer_result_s", header: asBufferPoolHeader.} = object
    data*: pointer
    capacity*: uint32
  as_buffer_pool* {.importc: "struct as_buffer_pool_s", header: asBufferPoolHeader.} = object
    queue*: ptr cf_queue
    header_size*, buffer_size*: uint32

proc as_buffer_pool_init*(pool: ptr as_buffer_pool, header_size, buffer_size: uint32): cint {.importc, dynlib: asLibName.}
proc as_buffer_pool_pop*(pool: ptr as_buffer_pool, size: uint32, buffer: ptr as_buffer_result): cint {.importc, dynlib: asLibName.}
proc as_buffer_pool_push*(pool: ptr as_buffer_pool, buffer: pointer, capacity: uint32): cint {.importc, dynlib: asLibName.}
proc as_buffer_pool_push_limit*(pool: ptr as_buffer_pool, buffer: pointer, capacity, max_buffers: uint32): cint {.importc, dynlib: asLibName.}
proc as_buffer_pool_drop_buffers*(pool: ptr as_buffer_pool, buffer_count: cint): cint {.importc, dynlib: asLibName.}
proc as_buffer_pool_destroy*(pool: ptr as_buffer_pool): cint {.importc, dynlib: asLibName.}