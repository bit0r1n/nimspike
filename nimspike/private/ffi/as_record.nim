import utils, as_key, as_bin
import common/aerospike/types/[ as_rec, as_bytes, as_integer, as_double, as_string, as_geojson, as_list, as_map, as_val ]

const asRecordHeader = "aerospike/as_record.h"

type
  as_record* {.importc: "struct as_record_s", header: asRecordHeader.} = object
    `_`*: as_rec
    key*: as_key
    gen*: uint16
    ttl*: uint32
    bins*: as_bins

const
  AS_RECORD_DEFAULT_TTL* = 0
  AS_RECORD_NO_EXPIRE_TTL* = 0xFFFFFFFF
  AS_RECORD_NO_CHANGE_TTL* = 0xFFFFFFFE
  AS_RECORD_CLIENT_DEFAULT_TTL* = 0xFFFFFFFD

proc as_record_inita*(rec: ptr as_record, nbins: uint16): ptr as_record {.importc, dynlib: asLibName.}
proc as_record_new*(nbins: uint16): ptr as_record {.importc, dynlib: asLibName.}
proc as_record_init*(rec: ptr as_record, nbins: uint16): ptr as_record {.importc, dynlib: asLibName.}
proc as_record_destroy*(rec: ptr as_record): void {.importc, dynlib: asLibName.}
proc as_record_numbins*(rec: ptr as_record): uint16 {.importc, dynlib: asLibName.}
proc as_record_set*(rec: ptr as_record, name: cstring, value: ptr as_bin_value): bool {.importc, dynlib: asLibName.}
proc as_record_set_bool*(rec: ptr as_record, name: cstring, value: bool): bool {.importc, dynlib: asLibName.}
proc as_record_set_int64*(rec: ptr as_record, name: cstring, value: int64): bool {.importc, dynlib: asLibName.}
proc as_record_set_double*(rec: ptr as_record, name: cstring, value: cdouble): bool {.importc, dynlib: asLibName.}
proc as_record_set_strp*(rec: ptr as_record, name, value: cstring, free: bool): bool {.importc, dynlib: asLibName.}
# proc as_record_set_str*(rec: ptr as_record, name, value: cstring): bool {.importc, dynlib: asLibName.}
proc as_record_set_geojson_strp*(rec: ptr as_record, name, value: cstring, free: bool): bool {.importc, dynlib: asLibName.}
proc as_record_set_geojson_str*(rec: ptr as_record, name, value: cstring): bool {.importc, dynlib: asLibName.}
proc as_record_set_rawp*(rec: ptr as_record, name: cstring, value: ptr uint8, size: uint32, free: bool): bool {.importc, dynlib: asLibName.}
proc as_record_set_raw_typep*(rec: ptr as_record, name: cstring, value: ptr uint8, size: uint32, `type`: as_bytes_type, free: bool): bool {.importc, dynlib: asLibName.}
proc as_record_set_raw*(rec: ptr as_record, name: cstring, value: ptr uint8, size: uint32): bool {.importc, dynlib: asLibName.}
proc as_record_set_integer*(rec: ptr as_record, name: cstring, value: ptr as_integer): bool {.importc, dynlib: asLibName.}
proc as_record_set_as_double*(rec: ptr as_record, name: cstring, value: ptr as_double): bool {.importc, dynlib: asLibName.}
proc as_record_set_string*(rec: ptr as_record, name: cstring, value: ptr as_string): bool {.importc, dynlib: asLibName.}
proc as_record_set_geojson*(rec: ptr as_record, name: cstring, value: ptr as_geojson): bool {.importc, dynlib: asLibName.}
proc as_record_set_bytes*(rec: ptr as_record, name: cstring, value: ptr as_bytes): bool {.importc, dynlib: asLibName.}
proc as_record_set_list*(rec: ptr as_record, name: cstring, value: ptr as_list): bool {.importc, dynlib: asLibName.}
proc as_record_set_map*(rec: ptr as_record, name: cstring, value: ptr as_map): bool {.importc, dynlib: asLibName.}
proc as_record_set_nil*(rec: ptr as_record, name: ptr as_map): bool {.importc, dynlib: asLibName.}

proc as_record_get*(rec: ptr as_record, name: cstring): ptr as_bin_value {.importc, dynlib: asLibName.}
proc as_record_get_bool*(rec: ptr as_record, name: cstring): bool {.importc, dynlib: asLibName.}
proc as_record_get_int64*(rec: ptr as_record, name: cstring): int64 {.importc, dynlib: asLibName.}
proc as_record_get_double*(rec: ptr as_record, name: cstring): cdouble {.importc, dynlib: asLibName.}
proc as_record_get_str*(rec: ptr as_record, name: cstring): cstring {.importc, dynlib: asLibName.}
proc as_record_get_geojson_str*(rec: ptr as_record, name: cstring): cstring {.importc, dynlib: asLibName.}
proc as_record_get_integer*(rec: ptr as_record, name: cstring): ptr as_integer {.importc, dynlib: asLibName.}
proc as_record_get_as_double*(rec: ptr as_record, name: cstring): ptr as_double {.importc, dynlib: asLibName.}
proc as_record_get_string*(rec: ptr as_record, name: cstring): ptr as_string {.importc, dynlib: asLibName.}
proc as_record_get_geojson*(rec: ptr as_record, name: cstring): ptr as_geojson {.importc, dynlib: asLibName.}
proc as_record_get_bytes*(rec: ptr as_record, name: cstring): ptr as_bytes {.importc, dynlib: asLibName.}
proc as_record_get_list*(rec: ptr as_record, name: cstring): ptr as_list {.importc, dynlib: asLibName.}
proc as_record_get_map*(rec: ptr as_record, name: cstring): ptr as_map {.importc, dynlib: asLibName.}
proc as_record_get_udf_result*(rec: ptr as_record): ptr as_val {.importc, dynlib: asLibName.}
proc as_record_get_udf_error*(rec: ptr as_record): cstring {.importc, dynlib: asLibName.}

proc as_record_foreach*(rec: ptr as_record, callback: as_rec_foreach_callback, udata: pointer): bool {.importc, dynlib: asLibName.}

proc as_record_toval*(rec: ptr as_record): ptr as_val {.importc, dynlib: asLibName.}
proc as_record_fromval*(v: ptr as_val): ptr as_record {.importc, dynlib: asLibName.}
