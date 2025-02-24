const asLogHeader = "aerospike/as_log.h"

type
  as_log_level* {.importc: "enum as_log_level_e" header: asLogHeader.} = enum
    AS_LOG_LEVEL_ERROR
    AS_LOG_LEVEL_WARN
    AS_LOG_LEVEL_INFO
    AS_LOG_LEVEL_DEBUG
    AS_LOG_LEVEL_TRACE
  as_log_callback* = proc (level: as_log_level, `func`, file: cstring, line: uint32, fmt: cstring): bool {.cdecl, varargs.}
  as_log* {.importc: "struct as_log_s", header: asLogHeader.} = object
    level*: as_log_level
    callback_set*: bool
    callback*: as_log_callback

var
  g_as_log* {.importc, header: asLogHeader.}: ptr as_log
  as_log_level_strings* {.importc: "as_log_level_strings", header: asLogHeader.}: ptr UncheckedArray[cstring]

proc as_log_set_level*(level: as_log_level): void {.importc, header: asLogHeader.}
proc as_log_set_callback*(callback: as_log_callback): void {.importc, header: asLogHeader.}
proc as_log_level_tostring*(level: as_log_level): cstring {.importc, header: asLogHeader.}