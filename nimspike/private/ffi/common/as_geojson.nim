import ../utils, as_val

const asGeoJsonHeader* = "aerospike/as_geojson.h"

type
  as_geojson* {.importc: "struct as_geojson_s", header: asGeoJsonHeader.} = object
    `_`*: as_val
    free*: bool
    value*: cstring
    len*: csize_t
  as_geojson_ptr* = ptr as_geojson

proc as_geojson_init*(str: as_geojson_ptr, value: cstring, free: bool): as_geojson_ptr {.importc, dynlib: getLibName().}
proc as_geojson_init_wlen*(str: as_geojson_ptr, value: cstring, len: csize_t, free: bool): as_geojson_ptr {.importc, dynlib: getLibName().}
proc as_geojson_new*(value: cstring, free: bool): as_geojson_ptr {.importc, dynlib: getLibName().}
proc as_geojson_new_wlen*(value: cstring, len: csize_t, free: bool): as_geojson_ptr {.importc, dynlib: getLibName().}
proc as_geojson_new_strdup*(value: cstring): as_geojson_ptr {.importc, dynlib: getLibName().}
proc as_geojson_destroy*(str: as_geojson_ptr): void {.importc, dynlib: getLibName().}

proc as_geojson_len*(str: as_geojson_ptr): csize_t {.importc, dynlib: getLibName().}
proc as_geojson_getorelse*(str: as_geojson_ptr, fallback: cstring): cstring {.importc, dynlib: getLibName().}
proc as_geojson_get*(str: as_geojson_ptr): cstring {.importc, dynlib: getLibName().}

proc as_geojson_toval*(str: as_geojson_ptr): as_val_ptr {.importc, dynlib: getLibName().}
proc as_geojson_fromval*(v: as_val_ptr): as_geojson_ptr {.importc, dynlib: getLibName().}

proc as_geojson_val_destroy*(v: as_val_ptr): void {.importc, dynlib: getLibName().}
proc as_geojson_val_hashcode*(v: as_val_ptr): uint32 {.importc, dynlib: getLibName().}
proc as_geojson_val_tostring*(v: as_val_ptr): cstring {.importc, dynlib: getLibName().}
