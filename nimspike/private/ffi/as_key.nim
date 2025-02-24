import utils, as_status, as_error
import common/aerospike/types/[ as_bytes, as_integer, as_string ]

const asKeyHeader = "aerospike/as_key.h"

const
  AS_DIGEST_VALUE_SIZE* = 20
  AS_NAMESPACE_MAX_SIZE* = 32
  AS_SET_MAX_SIZE* = 64

type
  as_namespace* = cstring
  as_set* = cstring
  as_digest_value* = array[AS_DIGEST_VALUE_SIZE, uint8]
  as_digest* {.importc: "struct as_digest_s", header: asKeyHeader.} = object
    init*: bool
    value*: as_digest_value
  as_key_value* {.importc: "union as_key_value_u", header: asKeyHeader, union.} = object
    integer*: as_integer
    `string`*: as_string
    bytes*: as_bytes
  as_key* {.importc: "struct as_key_s", header: asKeyHeader.} = object
    free* {.importc: "_free".}: bool
    ns*: as_namespace
    `set`*: as_set
    value*: as_key_value
    valuep*: ptr as_key_value
    digest*: as_digest

proc as_key_init*(key: ptr as_key, ns, `set`, value: cstring): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_init_int64*(key: ptr as_key, ns, `set`: cstring, value: int64): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_init_strp*(key: ptr as_key, ns, `set`, value: cstring, free: bool): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_init_str*(key: ptr as_key, ns, `set`, value: cstring): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_init_rawp*(key: ptr as_key, ns, `set`: cstring, value: ptr uint8, size: uint32, free: bool): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_init_raw*(key: ptr as_key, ns, `set`: cstring, value: ptr uint8, size: uint32): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_init_digest*(key: ptr as_key, ns, `set`: cstring, digest: as_digest_value): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_init_value*(key: ptr as_key, ns, `set`: cstring, value: ptr as_key_value): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_new*(ns, `set`, value: cstring): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_new_int64*(ns, `set`: cstring, value: int64): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_new_strp*(ns, `set`, value: cstring, free: bool): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_new_str*(ns, `set`, value: cstring): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_new_rawp*(ns, `set`: cstring, value: ptr uint8, size: uint32, free: bool): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_new_raw*(ns, `set`: cstring, value: ptr uint8, size: uint32): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_new_digest*(ns, `set`: cstring, digest: as_digest_value): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_new_value*(ns, `set`: cstring, value: ptr as_key_value): ptr as_key {.importc, dynlib: asLibName.}
proc as_key_destroy*(key: ptr as_key): void {.importc, dynlib: asLibName.}
proc as_key_digest*(key: ptr as_key): ptr as_digest {.importc, dynlib: asLibName.}
proc as_key_set_digest*(err: ptr as_error, key: ptr as_key): as_status {.importc, dynlib: asLibName.}
