import as_error, as_status, utils
import common/aerospike/as_queue
import posix

const asEventHeader = "aerospike/as_event.h"

type
  as_policy_event* {.importc: "struct as_policy_event_s" header: asEventHeader.} = object
    max_commands_in_process*: cint
    max_commands_in_queue*, queue_initial_capacity*: uint32
  as_event_loop* {.importc header: asEventHeader.} = object
    next*: ptr as_event_loop
    lock*: Pthread_mutex
    queue*, delay_queue*, pipe_cb_queue*: as_queue
    thread*: Pthread
    index*, max_commands_in_queue*, errors*: uint32
    max_commands_in_process*, pending*: cint
    using_delay_queue*, pipe_cb_calling*: bool
  
var
  as_event_loops* {.importc, header: asEventHeader.}: ptr as_event_loop
  as_event_loop_current* {.importc, header: asEventHeader.}: ptr as_event_loop
  as_event_loop_size* {.importc, header: asEventHeader.}: uint32
  as_event_single_thread* {.importc, header: asEventHeader.}: bool

proc as_policy_event_init*(policy: ptr as_policy_event): void {.importc, dynlib: asLibName.}
proc as_event_create_loops*(capacity: uint32): ptr as_event_loop {.importc, dynlib: asLibName.}
proc as_create_event_loops*(err: ptr as_error, policy: ptr as_policy_event, capacity: uint32, event_loops: ptr UncheckedArray[ptr as_event_loop]): as_status {.importc, dynlib: asLibName.}
proc as_event_set_external_loop_capacity*(capacity: uint32): bool {.importc, dynlib: asLibName.}
proc as_event_set_external_loop*(loop: pointer): ptr as_event_loop {.importc, dynlib: asLibName.}
proc as_set_external_event_loop*(err: ptr as_error, policy: ptr as_policy_event, loop: pointer, event_loop: ptr UncheckedArray[ptr as_event_loop]): as_status {.importc, dynlib: asLibName.}
proc as_event_loop_find*(loop: pointer): ptr as_event_loop {.importc, dynlib: asLibName.}
proc as_event_loop_get_by_index*(index: uint32): ptr as_event_loop {.importc, dynlib: asLibName.}
proc as_event_loop_get*(): ptr as_event_loop {.importc, dynlib: asLibName.}
proc as_event_loop_get_process_size*(event_loop: ptr as_event_loop): cint {.importc, dynlib: asLibName.}
proc as_event_loop_get_queue_size*(event_loop: ptr as_event_loop): uint32 {.importc, dynlib: asLibName.}
proc as_event_close_loops*(): bool {.importc, dynlib: asLibName.}
proc as_event_close_loop*(event_loop: ptr as_event_loop): void {.importc, dynlib: asLibName.}
proc as_event_destroy_loops*(): void {.importc, dynlib: asLibName.}
