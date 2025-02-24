import common/aerospike/types/[ as_val, as_boolean, as_integer, as_double, as_string, as_bytes, as_list, as_map ]

const asBinHeader = "aerospike/as_bin.h"

const AS_BIN_NAME_MAX_SIZE* = 16

type
  as_bin_name* = cstring
  as_bin_value* {.importc: "union as_bin_value_s", header: asBinHeader, union.} = object
    `nil`*: as_val
    boolean*: as_boolean
    integer*: as_integer
    dbl*: as_double
    `string`*: as_string
    bytes*: as_bytes
    list*: as_list
    map*: as_map
  as_bin* {.importc: "struct as_bin_s", header: asBinHeader, union.} = object
    name*: as_bin_name
    value*: as_bin_value
    valuep*: ptr as_bin_value
  as_bins* {.importc: "struct as_bins_s", header: asBinHeader, union.} = object
    entries*: ptr UncheckedArray[as_bin]
    capacity*, size*: uint16
    free* {.importc: "_free".}: bool

proc as_bin_get_name*(bin: ptr as_bin): cstring {.importc, header: asBinHeader.}
proc as_bin_get_value*(bin: ptr as_bin): ptr as_bin_value {.importc, header: asBinHeader.}
proc as_bin_get_type*(bin: ptr as_bin): as_val_t {.importc, header: asBinHeader.}