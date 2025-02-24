import ../../utils, posix, ../citrusleaf/cf_queue

const asThreadPoolHeader = "aerospike/as_thread_pool.h"

type
  as_task_fn* = proc (user_data: pointer): void {.cdecl.}
  as_fini_fn* = proc (): void {.cdecl.}
  as_thread_pool* {.importc: "struct as_thread_pool_s", header: asThreadPoolHeader.} = object
    threads*: ptr Pthread
    dispatch_queue*: ptr cf_queue
    fini_fn*: as_fini_fn
    thread_size*: uint32

proc as_thread_pool_init*(pool: ptr as_thread_pool, thread_size: uint32): cint {.importc, dynlib: asLibName.}
proc as_thread_pool_queue_task*(pool: ptr as_thread_pool, task_fn: as_task_fn, task: pointer): cint {.importc, dynlib: asLibName.}
proc as_thread_pool_destroy*(pool: ptr as_thread_pool): cint {.importc, dynlib: asLibName.}