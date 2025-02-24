import ../../utils, as_queue, posix

const asQueueMtHeader = "aerospike/as_queue_mt.h"

type
  as_queue_mt* {.importc: "struct as_queue_mt_s", header: asQueueMtHeader.} = object
    queue*: as_queue
    lock*: Pthread_mutex
    cond*: Pthread_cond


proc as_queue_mt_inita*(queue: ptr as_queue_mt, item_size, capacity: uint32): void {.importc, dynlib: asLibName.}
proc as_queue_mt_init*(queue: ptr as_queue_mt, item_size, capacity: uint32): void {.importc, dynlib: asLibName.}
proc as_queue_mt_create*(item_size, capacity: uint32): ptr as_queue_mt {.importc, dynlib: asLibName.}
proc as_queue_mt_destroy*(queue: ptr as_queue_mt): void {.importc, header: asQueueMtHeader.}
proc as_queue_mt_size*(queue: ptr as_queue_mt): uint32 {.importc, header: asQueueMtHeader.}
proc as_queue_mt_empty*(queue: ptr as_queue_mt): bool {.importc, header: asQueueMtHeader.}
proc as_queue_mt_push*(queue: ptr as_queue_mt, `ptr`: pointer): bool {.importc, header: asQueueMtHeader.}
proc as_queue_mt_push_limit*(queue: ptr as_queue_mt, `ptr`: pointer): bool {.importc, header: asQueueMtHeader.}
proc as_queue_mt_push_head*(queue: ptr as_queue_mt, `ptr`: pointer): bool {.importc, header: asQueueMtHeader.}
proc as_queue_mt_push_head_limit*(queue: ptr as_queue_mt, `ptr`: pointer): bool {.importc, header: asQueueMtHeader.}
proc as_queue_mt_get*(queue: ptr as_queue_mt, index: uint32): pointer {.importc, dynlib: asLibName.}
proc as_queue_mt_pop*(queue: ptr as_queue_mt, `ptr`: pointer): bool {.importc, dynlib: asLibName.}
proc as_queue_mt_pop_tail*(queue: ptr as_queue_mt, `ptr`: pointer): bool {.importc, dynlib: asLibName.}