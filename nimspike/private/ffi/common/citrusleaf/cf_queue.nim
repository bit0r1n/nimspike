import ../../utils
import posix

const cfQueueHeader* = "citrusleaf/cf_queue.h"

type
  cf_queue_reduce_fn* = proc (buf: pointer, udata: pointer): int {.cdecl.}
  cf_queue* {.importc: "struct cf_queue_s", header: cfQueueHeader.} = object
    threadsafe*, free_struct*: bool
    alloc_sz*, read_offset*, write_offset*: uint
    n_eles*: uint32
    element_sz*: csize_t
    LOCK*: Pthread_mutex
    CV*: Pthread_cond
    elements*: ptr uint8

proc cf_queue_init*(q: ptr cf_queue, elements_sz: csize_t, capacity: uint32, threadsafe: bool): bool {.importc, dynlib: asLibName.}
proc cf_queue_create*(element_sz: csize_t, threadsafe: bool): ptr cf_queue {.importc, dynlib: asLibName.}
proc cf_queue_destroy*(q: ptr cf_queue): void {.importc, dynlib: asLibName.}

proc cf_queue_sz*(q: ptr cf_queue): uint32 {.importc, dynlib: asLibName.}
proc cf_queue_push*(q: ptr cf_queue, `ptr`: pointer): cint {.importc, dynlib: asLibName.}
proc cf_queue_push_limit*(q: ptr cf_queue, `ptr`: pointer, limit: uint32): bool {.importc, dynlib: asLibName.}
proc cf_queue_push_index*(q: ptr cf_queue, `ptr`: pointer, ix: uint32): cint {.importc, dynlib: asLibName.}
proc cf_queue_push_unique*(q: ptr cf_queue, `ptr`: pointer): cint {.importc, dynlib: asLibName.}
proc cf_queue_push_head*(q: ptr cf_queue, `ptr`: pointer): cint {.importc, dynlib: asLibName.}
proc cf_queue_peek*(q: ptr cf_queue, buf: pointer): cint {.importc, dynlib: asLibName.}
proc cf_queue_pop*(q: ptr cf_queue, buf: pointer, ms_wait: cint): cint {.importc, dynlib: asLibName.}
proc cf_queue_reduce*(q: ptr cf_queue, cb: cf_queue_reduce_fn, udata: pointer): cint {.importc, dynlib: asLibName.}
proc cf_queue_reduce_pop*(q: ptr cf_queue, buf: pointer, ms_wait: cint, cb: cf_queue_reduce_fn, udata: pointer): cint {.importc, dynlib: asLibName.}
proc cf_queue_reduce_reverse*(q: ptr cf_queue, cb: cf_queue_reduce_fn, udata: pointer): cint {.importc, dynlib: asLibName.}
proc cf_queue_delete*(q: ptr cf_queue, buf: pointer, only_one: bool): cint {.importc, dynlib: asLibName.}
proc cf_queue_delete_all*(q: ptr cf_queue): cint {.importc, dynlib: asLibName.}
proc cf_queue_delete_offset*(q: ptr cf_queue, index: uint32): cint {.importc, dynlib: asLibName.}