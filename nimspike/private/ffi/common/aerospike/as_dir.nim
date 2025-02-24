import ../../utils

const asDirHeader = "aerospike/as_dir.h"

type as_dir* {.importc: "struct as_dir_s", header: asDirHeader.} = object

proc as_dir_exists*(directory: cstring): bool {.importc, header: asDirHeader.}
proc as_dir_open*(dir: ptr as_dir, directory: cstring): bool {.importc, header: asDirHeader.}
proc as_dir_read*(dir: ptr as_dir): cstring {.importc, header: asDirHeader.}
proc as_dir_close*(dir: ptr as_dir): void {.importc, header: asDirHeader.}