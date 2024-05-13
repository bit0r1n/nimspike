import ../utils

const asValHeader* = "aerospike/as_val.h"

type
  as_val_t* = uint8
  as_val_type_e* {.importc: "enum as_val_type_e" header: asValHeader.} = enum
    AS_UNDEF = 0
    AS_NIL = 1
    AS_BOOLEAN = 2
    AS_INTEGER = 3
    AS_STRING = 4
    AS_LIST = 5
    AS_MAP = 6
    AS_REC = 7
    AS_PAIR = 8
    AS_BYTES = 9
    AS_DOUBLE = 10
    AS_GEOJSON = 11

    AS_CMP_EXT
    AS_CMP_WILDCARD
    AS_CMP_INF
  
    AS_VAL_T_MAX
  as_val* {.importc: "struct as_val_s", header: asValHeader.} = object
    count*: uint32
    `type`*: as_val_t
    free*: bool
  as_val_ptr* = ptr as_val

proc as_val_type*(v: as_val_ptr): as_val_type_e {.importc, dynlib: getLibName().}

proc as_val_val_reserve*(v: as_val_ptr): as_val_type_e {.importc, dynlib: getLibName().}
proc as_val_reserve*(v: as_val_ptr): as_val_ptr {.importc, dynlib: getLibName().}

proc as_val_val_destroy*(v: as_val_ptr): as_val_ptr {.importc, dynlib: getLibName().}
proc as_val_destroy*(v: as_val_ptr): as_val_ptr {.importc, dynlib: getLibName().}

proc as_val_val_hashcode*(v: as_val_ptr): uint32 {.importc, dynlib: getLibName().}
proc as_val_hashcode*(v: as_val_ptr): uint32 {.importc, dynlib: getLibName().}

proc as_val_val_tostring*(v: as_val_ptr): cstring {.importc, dynlib: getLibName().}
proc as_val_tostring*(v: as_val_ptr): cstring {.importc, dynlib: getLibName().}


proc as_val_init*(v: as_val_ptr, `type`: as_val_t, free: bool): void {.importc, dynlib: getLibName().}
proc as_val_cons*(v: as_val_ptr, `type`: as_val_t, free: bool): as_val_ptr {.importc, dynlib: getLibName().}