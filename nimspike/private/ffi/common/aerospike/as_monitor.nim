import ../../utils, posix

const asMonitorHeader = "aerospike/as_monitor.h"

type
  as_monitor* {.importc, header: asMonitorHeader.} = object
    lock*: Pthread_mutex
    cond*: Pthread_cond
    complete*: bool

proc as_monitor_init*(monitor: ptr as_monitor): void {.importc, dynlib: asLibName.}
proc as_monitor_destroy*(monitor: ptr as_monitor): void {.importc, dynlib: asLibName.}
proc as_monitor_begin*(monitor: ptr as_monitor): void {.importc, dynlib: asLibName.}
proc as_monitor_notify*(monitor: ptr as_monitor): void {.importc, dynlib: asLibName.}
proc as_monitor_wait*(monitor: ptr as_monitor): void {.importc, dynlib: asLibName.}