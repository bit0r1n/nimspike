import ../../../utils, as_val

const asStreamHeader = "aerospike/as_stream.h"

type
  as_stream_status* {.importc: "enum as_stream_status_e", header: asStreamHeader.} = enum
    AS_STREAM_OK = 0
    AS_STREAM_ERR = 1
  as_stream* {.importc: "struct as_stream_s", header: asStreamHeader.} = object
    free*: bool
    data*: pointer
    hooks*: ptr as_stream_hooks
  as_stream_hooks* {.importc: "struct as_stream_hooks_s", header: asStreamHeader.} = object
    destroy*: proc (stream: ptr as_stream): int {.cdecl.}
    read*: proc (stream: ptr as_stream): ptr as_val {.cdecl.}
    write*: proc (stream: ptr as_stream, value: ptr as_val): as_stream_status {.cdecl.}

proc as_stream_malloc*(size: csize_t): pointer {.importc, dynlib: asLibName.}
proc as_stream_free*(`ptr`: pointer): void {.importc, dynlib: asLibName.}

proc as_stream_init*(stream: ptr as_stream, data: pointer, hooks: ptr as_stream_hooks): ptr as_stream {.importc, header: asStreamHeader.}
proc as_stream_new*(data: pointer, hooks: ptr as_stream_hooks): ptr as_stream {.importc, header: asStreamHeader.}
proc as_stream_destroy*(stream: ptr as_stream): void {.importc, header: asStreamHeader.}

proc as_stream_source*(stream: ptr as_stream): pointer {.importc, header: asStreamHeader.}
proc as_stream_read*(stream: ptr as_stream): ptr as_val {.importc, header: asStreamHeader.}
proc as_stream_readable*(stream: ptr as_stream): bool {.importc, header: asStreamHeader.}
proc as_stream_write*(stream: ptr as_stream, value: ptr as_val): as_stream_status {.importc, header: asStreamHeader.}
proc as_stream_writable*(stream: ptr as_stream): bool {.importc, header: asStreamHeader.}