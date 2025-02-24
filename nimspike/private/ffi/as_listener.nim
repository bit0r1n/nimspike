import utils, as_error, as_event, as_record
import common/aerospike/types/as_val

proc as_async_write_listener*(err: ptr as_error, udata: pointer, event_loop: ptr as_event_loop): void {.importc, dynlib: asLibName.}
proc as_async_record_listener*(err: ptr as_error, record: ptr as_record, udata: pointer, event_loop: ptr as_event_loop): void {.importc, dynlib: asLibName.}
proc as_async_value_listener*(err: ptr as_error, val: ptr as_val, udata: pointer, event_loop: ptr as_event_loop): void {.importc, dynlib: asLibName.}
proc as_pipe_listener*(udata: pointer, event_loop: ptr as_event_loop): void {.importc, dynlib: asLibName.}
proc as_async_info_listener*(err: ptr as_error, response: ptr UncheckedArray[char], udata: pointer, event_loop: ptr as_event_loop): void {.importc, dynlib: asLibName.}
