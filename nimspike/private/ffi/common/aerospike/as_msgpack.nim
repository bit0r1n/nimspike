import ../../utils, as_serializer, types/as_val

const asMsgpackHeader = "aerospike/as_msgpack.h"

type
  as_packer_buffer* {.importc: "struct as_packer_buffer", header: asMsgpackHeader.} = object
    next*: ptr as_packer_buffer
    buffer*: ptr uint8
    length*: uint32
  as_packer* {.importc: "struct as_packer", header: asMsgpackHeader.} = object
    head*, tail*: ptr as_packer_buffer
    buffer*: ptr uint8
    offset*, capacity*: uint32
  as_unpacker* {.importc: "struct as_unpacker", header: asMsgpackHeader.} = object
    buffer*: ptr uint8
    offset*, length*: uint32
  as_msgpack_ext* {.importc: "struct as_msgpack_ext_s", header: asMsgpackHeader.} = object
    data*: ptr uint8
    size*, type_offset*: uint32
    `type`*: uint8
  msgpack_compare_t* {.importc: "enum msgpack_compare_e", header: asMsgpackHeader.} = enum
    MSGPACK_COMPARE_ERROR = -2
    MSGPACK_COMPARE_END
    MSGPACK_COMPARE_LESS
    MSGPACK_COMPARE_EQUAL
    MSGPACK_COMPARE_GREATER

proc as_msgpack_new*(): ptr as_serializer {.importc, dynlib: asLibName.}
proc as_msgpack_init*(ser: ptr as_serializer): cint {.importc, dynlib: asLibName.}
proc as_pack_val*(pk: ptr as_packer, val: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_unpack_val*(pk: ptr as_unpacker, val: ptr UncheckedArray[ptr as_val]): cint {.importc, dynlib: asLibName.}
proc as_val_cmp*(v1, v2: ptr as_val): msgpack_compare_t {.importc, dynlib: asLibName.}

proc as_pack_nil_size*(): cint {.importc, header: asMsgpackHeader.}
proc as_pack_bool_size*(): cint {.importc, header: asMsgpackHeader.}
proc as_pack_nil*(pk: ptr as_packer): cint {.importc, dynlib: asLibName.}
proc as_pack_bool*(pk: ptr as_packer, val: bool): cint {.importc, dynlib: asLibName.}
proc as_pack_cmp_inf_size*(): uint32 {.importc, header: asMsgpackHeader.}
proc as_pack_cmp_wildcard_size*(): uint32 {.importc, header: asMsgpackHeader.}
proc as_pack_cmp_inf*(pk: ptr as_packer): cint {.importc, dynlib: asLibName.}
proc as_pack_cmp_wildcard*(pk: ptr as_packer): cint {.importc, dynlib: asLibName.}

proc as_pack_uint64_size*(val: uint64): uint32 {.importc, dynlib: asLibName.}
proc as_pack_int64_size*(val: int64): uint32 {.importc, dynlib: asLibName.}
proc as_pack_uint64*(pk: ptr as_packer, val: uint64): cint {.importc, dynlib: asLibName.}
proc as_pack_int64*(pk: ptr as_packer, val: int64): cint {.importc, dynlib: asLibName.}

proc as_pack_float_size*(): uint32 {.importc, header: asMsgpackHeader.}
proc as_pack_double_size*(): uint32 {.importc, header: asMsgpackHeader.}
proc as_pack_float*(pk: ptr as_packer, val: cfloat): cint {.importc, dynlib: asLibName.}
proc as_pack_double*(pk: ptr as_packer, val: cdouble): cint {.importc, dynlib: asLibName.}

proc as_pack_bytes*(pk: ptr as_packer, buf: ptr uint8, sz: uint32): cint {.importc, dynlib: asLibName.}

proc as_pack_str_size*(str_sz: uint32): uint32 {.importc, dynlib: asLibName.}
proc as_pack_bin_size*(bin_sz: uint32): uint32 {.importc, dynlib: asLibName.}
proc as_pack_str*(pk: ptr as_packer, buf: ptr uint8, sz: uint32): cint {.importc, dynlib: asLibName.}
proc as_pack_bin*(pk: ptr as_packer, buf: ptr uint8, sz: uint32): cint {.importc, dynlib: asLibName.}

proc as_pack_list_header*(pk: ptr as_packer, ele_count: uint32): cint {.importc, dynlib: asLibName.}
proc as_pack_list_header_get_size*(ele_count: uint32): uint32 {.importc, dynlib: asLibName.}
proc as_pack_map_header*(pk: ptr as_packer, ele_count: uint32): cint {.importc, dynlib: asLibName.}
proc as_pack_map_header_get_size*(ele_count: uint32): uint32 {.importc, header: asMsgpackHeader.}

proc as_pack_ext_header_get_size*(content_size: uint32): uint32 {.importc, dynlib: asLibName.}
proc as_pack_ext_header*(pk: ptr as_packer, content_size: uint32, `type`: uint8): cint {.importc, dynlib: asLibName.}
proc as_pack_buf_ext_header*(buf: ptr uint8, size, content_size: uint32, `type`: uint8): cint {.importc, dynlib: asLibName.}
proc as_pack_append*(pk: ptr as_packer, buf: ptr uint8, sz: uint32): cint {.importc, dynlib: asLibName.}

proc as_unpack_peek_type*(pk: ptr as_unpacker): as_val_t {.importc, dynlib: asLibName.}
proc as_unpack_buf_peek_type*(buf: ptr uint8, size: uint32): as_val_t {.importc, dynlib: asLibName.}
proc as_unpack_peek_is_ext*(pk: ptr as_unpacker): bool {.importc, dynlib: asLibName.}
proc as_unpack_boolean*(pk: ptr as_unpacker, value: ptr bool): cint {.importc, dynlib: asLibName.}
proc as_unpack_nil*(pk: ptr as_unpacker): cint {.importc, dynlib: asLibName.}
proc as_unpack_size*(pk: ptr as_unpacker): int64 {.importc, dynlib: asLibName.}
proc as_unpack_blob_size*(pk: ptr as_unpacker): int64 {.importc, dynlib: asLibName.}
proc as_unpack_int64*(pk: ptr as_unpacker, i: ptr int64): cint {.importc, dynlib: asLibName.}
proc as_unpack_uint64*(pk: ptr as_unpacker, i: ptr uint64): cint {.importc, dynlib: asLibName.}
proc as_unpack_double*(pk: ptr as_unpacker, x: ptr cdouble): cint {.importc, dynlib: asLibName.}
proc as_unpack_str*(pk: ptr as_unpacker, sz_r: ptr uint32): cstring {.importc, dynlib: asLibName.}
proc as_unpack_bin*(pk: ptr as_unpacker, sz_r: ptr uint32): cstring {.importc, dynlib: asLibName.}
proc as_unpack_ext*(pk: ptr as_unpacker, ext: ptr as_msgpack_ext): cint {.importc, dynlib: asLibName.}

proc as_unpack_buf_list_element_count*(buf: ptr uint8, size: uint32): int64 {.importc, dynlib: asLibName.}
proc as_unpack_list_header_element_count*(pk: ptr as_unpacker): int64 {.importc, dynlib: asLibName.}
proc as_unpack_buf_map_element_count*(buf: ptr uint8, size: uint32): int64 {.importc, dynlib: asLibName.}
proc as_unpack_map_header_element_count*(pk: ptr as_unpacker): int64 {.importc, dynlib: asLibName.}

proc as_unpack_buf_compare*(buf1: ptr uint8, size1: uint32, buf2: ptr uint8, size2: uint32): msgpack_compare_t {.importc, dynlib: asLibName.}
proc as_unpack_compare*(pk1, pk2: ptr as_unpacker): msgpack_compare_t {.importc, dynlib: asLibName.}
proc as_unpack_buf_is_less*(buf1: ptr uint8, size1: uint32, buf2: ptr uint8, size2: uint32): bool {.importc, header: asMsgpackHeader.}
