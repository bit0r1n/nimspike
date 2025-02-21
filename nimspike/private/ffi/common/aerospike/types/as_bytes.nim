import ../../../utils, as_val

const asBytesHeader* = "aerospike/as_bytes.h"

type
  as_bytes_type* {.importc: "struct as_bytes_type_e", header: asBytesHeader.} = enum
    AS_BYTES_UNDEF = 0

    AS_BYTES_INTEGER = 1
    AS_BYTES_DOUBLE = 2
    AS_BYTES_STRING = 3
    AS_BYTES_BLOB = 4

    AS_BYTES_JAVA = 7
    AS_BYTES_CSHARP = 8
    AS_BYTES_PYTHON = 9
    AS_BYTES_RUBY = 10
    AS_BYTES_PHP = 11
    AS_BYTES_ERLANG = 12

    AS_BYTES_VECTOR = 16
    AS_BYTES_BOOL = 17
    AS_BYTES_HLL = 18
    AS_BYTES_MAP = 19
    AS_BYTES_LIST = 20
    AS_BYTES_GEOJSON = 23

    AS_BYTES_TYPE_MAX = 24

  as_bytes* {.importc: "struct as_bytes_s", header: asBytesHeader.} = object
    `_`*: as_val
    capacity*, size*: uint32
    value*: uint8
    free*: bool
    `type`*: as_bytes_type

proc as_bytes_init*(bytes: ptr as_bytes, capacity: uint32): ptr as_bytes {.importc, dynlib: asLibName.}
proc as_bytes_init_wrap*(bytes: ptr as_bytes, value: uint8, size: uint32, free: bool): ptr as_bytes {.importc, dynlib: asLibName.}
proc as_bytes_new*(capacity: uint32): ptr as_bytes {.importc, dynlib: asLibName.}
proc as_bytes_new_wrap*(value: uint8, size: uint32, free: bool): ptr as_bytes {.importc, dynlib: asLibName.}
proc as_bytes_destroy*(bytes: ptr as_bytes): void {.importc, dynlib: asLibName.}

proc as_bytes_size*(bytes: ptr as_bytes): uint32 {.importc, dynlib: asLibName.}
proc as_bytes_capacity*(bytes: ptr as_bytes): uint32 {.importc, dynlib: asLibName.}
proc as_bytes_get_type*(bytes: ptr as_bytes): as_bytes_type {.importc, dynlib: asLibName.}
proc as_bytes_set_type*(bytes: ptr as_bytes, `type`: as_bytes_type): void {.importc, dynlib: asLibName.}
proc as_bytes_getorelse*(bytes: ptr as_bytes, fallback: uint8): uint8 {.importc, dynlib: asLibName.}
proc as_bytes_get*(bytes: ptr as_bytes): uint8 {.importc, dynlib: asLibName.}

proc as_bytes_copy*(bytes: ptr as_bytes, index: uint32, value: ptr uint8, size: uint32): uint32 {.importc, dynlib: asLibName.}
proc as_bytes_get_byte*(bytes: ptr as_bytes, index: uint32, value: ptr uint8): uint32 {.importc, dynlib: asLibName.}
proc as_bytes_get_int16*(bytes: ptr as_bytes, index: uint32, value: ptr int16): uint32 {.importc, dynlib: asLibName.}
proc as_bytes_get_int32*(bytes: ptr as_bytes, index: uint32, value: ptr int32): uint32 {.importc, dynlib: asLibName.}
proc as_bytes_get_int64*(bytes: ptr as_bytes, index: uint32, value: ptr int64): uint32 {.importc, dynlib: asLibName.}
proc as_bytes_get_double*(bytes: ptr as_bytes, index: uint32, value: ptr cdouble): uint32 {.importc, dynlib: asLibName.}
proc as_bytes_get_var_int*(bytes: ptr as_bytes, index: uint32, value: ptr uint32): uint32 {.importc, dynlib: asLibName.}

proc as_bytes_set*(bytes: ptr as_bytes, index: uint32, value: ptr uint8, size: uint32): bool {.importc, dynlib: asLibName.}
proc as_bytes_set_byte*(bytes: ptr as_bytes, index: uint32, value: uint8): bool {.importc, dynlib: asLibName.}
proc as_bytes_set_int16*(bytes: ptr as_bytes, index: uint32, value: int16): bool {.importc, dynlib: asLibName.}
proc as_bytes_set_int32*(bytes: ptr as_bytes, index: uint32, value: int32): bool {.importc, dynlib: asLibName.}
proc as_bytes_set_int64*(bytes: ptr as_bytes, index: uint32, value: int64): bool {.importc, dynlib: asLibName.}
proc as_bytes_set_double*(bytes: ptr as_bytes, index: uint32, value: cdouble): bool {.importc, dynlib: asLibName.}
proc as_bytes_set_var_int*(bytes: ptr as_bytes, index: uint32, value: uint32): uint32 {.importc, dynlib: asLibName.}

proc as_bytes_append*(bytes: ptr as_bytes, value: ptr uint8, size: uint32): bool {.importc, dynlib: asLibName.}
proc as_bytes_append_byte*(bytes: ptr as_bytes, value: uint8): bool {.importc, dynlib: asLibName.}
proc as_bytes_append_int16*(bytes: ptr as_bytes, value: int16): bool {.importc, dynlib: asLibName.}
proc as_bytes_append_int32*(bytes: ptr as_bytes, value: int32): bool {.importc, dynlib: asLibName.}
proc as_bytes_append_int64*(bytes: ptr as_bytes, value: int64): bool {.importc, dynlib: asLibName.}
proc as_bytes_append_double*(bytes: ptr as_bytes, value: cdouble): bool {.importc, dynlib: asLibName.}

proc as_bytes_truncate*(bytes: ptr as_bytes, n: uint32): bool {.importc, dynlib: asLibName.}
proc as_bytes_ensure*(bytes: ptr as_bytes, capacity: uint32, resize: bool): bool {.importc, dynlib: asLibName.}
proc as_bytes_tobytes*(bytes: ptr as_bytes, size: ptr uint32): uint8 {.importc, dynlib: asLibName.}

proc as_bytes_toval*(bytes: ptr as_bytes): ptr as_val {.importc, dynlib: asLibName.}
proc as_bytes_fromval*(v: ptr as_val): ptr as_bytes {.importc, dynlib: asLibName.}

proc as_bytes_val_destroy*(v: ptr as_val): void {.importc, dynlib: asLibName.}
proc as_bytes_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: asLibName.}
proc as_bytes_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: asLibName.}

proc as_bytes_to_string*(bytes: ptr uint8, bytes_size: uint32, str: cstring, str_size: uint32): bool {.importc, dynlib: asLibName.}
proc as_bytes_to_string_with_prefix*(bytes: ptr uint8, bytes_size: uint32, str: cstring, str_size: uint32): bool {.importc, dynlib: asLibName.}
proc as_bytes_from_string*(bytes: ptr uint8, bytes_size: uint32, str: cstring): cint {.importc, dynlib: asLibName.}