import ../../utils

const asTimerHeader = "aerospike/as_timer.h"

type
  as_timer* {.importc: "struct as_timer_s", header: asTimerHeader.} = object
    is_malloc*: bool
    source*: pointer
    hooks*: ptr as_timer_hooks
  as_timer_hooks* {.importc: "struct as_timer_hooks_s", header: asTimerHeader.} = object
    destroy*: proc (timer: ptr as_timer): cint {.cdecl.}
    timedout*: proc (timer: ptr as_timer): bool {.cdecl.}
    timeslice*: proc (timer: ptr as_timer): uint64 {.cdecl.}

proc as_timer_init*(timer: ptr as_timer, source: pointer, hooks: ptr as_timer_hooks): ptr as_timer {.importc, dynlib: asLibName.}
proc as_timer_new*(source: pointer, hooks: ptr as_timer_hooks): ptr as_timer {.importc, dynlib: asLibName.}
proc as_timer_source*(tt: ptr as_timer): pointer {.importc, header: asTimerHeader.}
proc as_timer_destroy*(timer: ptr as_timer): cint {.importc, dynlib: asLibName.}
proc as_timer_timedout*(timer: ptr as_timer): bool {.importc, dynlib: asLibName.}
proc as_timer_timeslice*(timer: ptr as_timer): uint64 {.importc, dynlib: asLibName.}