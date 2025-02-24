import ../../../utils, as_val

const asGeoJsonHeader = "aerospike/as_geojson.h"

type
  as_geojson* {.importc: "struct as_geojson_s", header: asGeoJsonHeader.} = object
    `_`*: as_val
    free*: bool
    value*: cstring
    len*: csize_t

proc as_geojson_init*(str: ptr as_geojson, value: cstring, free: bool): ptr as_geojson {.importc, dynlib: asLibName.}
proc as_geojson_init_wlen*(str: ptr as_geojson, value: cstring, len: csize_t, free: bool): ptr as_geojson {.importc, dynlib: asLibName.}
proc as_geojson_new*(value: cstring, free: bool): ptr as_geojson {.importc, dynlib: asLibName.}
proc as_geojson_new_wlen*(value: cstring, len: csize_t, free: bool): ptr as_geojson {.importc, dynlib: asLibName.}
proc as_geojson_new_strdup*(value: cstring): ptr as_geojson {.importc, dynlib: asLibName.}
proc as_geojson_destroy*(str: ptr as_geojson): void {.importc, header: asGeoJsonHeader.}

proc as_geojson_len*(str: ptr as_geojson): csize_t {.importc, dynlib: asLibName.}
proc as_geojson_getorelse*(str: ptr as_geojson, fallback: cstring): cstring {.importc, header: asGeoJsonHeader.}
proc as_geojson_get*(str: ptr as_geojson): cstring {.importc, header: asGeoJsonHeader.}

proc as_geojson_toval*(str: ptr as_geojson): ptr as_val {.importc, header: asGeoJsonHeader.}
proc as_geojson_fromval*(v: ptr as_val): ptr as_geojson {.importc, header: asGeoJsonHeader.}

proc as_geojson_val_destroy*(v: ptr as_val): void {.importc, dynlib: asLibName.}
proc as_geojson_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: asLibName.}
proc as_geojson_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: asLibName.}
