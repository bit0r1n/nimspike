import ../../utils

const asQueueHeader* = "aerospike/as_queue.h"

type
  as_queue* {.importc: "struct as_queue_s", header: asQueueHeader.} = object
    data*: ptr uint8
    capacity*, head*, tail*, item_size*, total*, flags*: uint32

proc as_queue_inita*(queue: ptr as_queue, item_size, capacity: uint32): void {.importc, dynlib: asLibName.}
proc as_queue_init*(queue: ptr as_queue, item_size, capacity: uint32): void {.importc, dynlib: asLibName.}
proc as_queue_create*(item_size, capacity: uint32): ptr as_queue {.importc, dynlib: asLibName.}
proc as_queue_destroy*(queue: ptr as_queue): void {.importc, dynlib: asLibName.}
proc as_queue_size*(queue: ptr as_queue): uint32 {.importc, dynlib: asLibName.}
proc as_queue_empty*(queue: ptr as_queue): bool {.importc, dynlib: asLibName.}
proc as_queue_push*(queue: ptr as_queue, `ptr`: pointer): bool {.importc, dynlib: asLibName.}
proc as_queue_push_limit*(queue: ptr as_queue, `ptr`: pointer): bool {.importc, dynlib: asLibName.}
proc as_queue_push_head*(queue: ptr as_queue, `ptr`: pointer): bool {.importc, dynlib: asLibName.}
proc as_queue_push_head_limit*(queue: ptr as_queue, `ptr`: pointer): bool {.importc, dynlib: asLibName.}
proc as_queue_get*(queue: ptr as_queue, index: uint32): pointer {.importc, dynlib: asLibName.}
proc as_queue_pop*(queue: ptr as_queue, `ptr`: pointer): bool {.importc, dynlib: asLibName.}
proc as_queue_pop_tail*(queue: ptr as_queue, `ptr`: pointer): bool {.importc, dynlib: asLibName.}
proc as_queue_incr_total*(queue: ptr as_queue): void {.importc, dynlib: asLibName.}
proc as_queue_decr_total*(queue: ptr as_queue): void {.importc, dynlib: asLibName.}