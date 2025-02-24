import types/[
  as_map, as_val, as_integer,
  as_double, as_string, as_bytes,
  as_list
]

const asStringmapHeader = "aerospike/as_stringmap.h"

proc as_stringmap_set*(m: ptr as_map, k: cstring, v: ptr as_val): cint {.importc, header: asStringmapHeader.}
proc as_stringmap_set_int64*(m: ptr as_map, k: cstring, v: int64): cint {.importc, header: asStringmapHeader.}
proc as_stringmap_set_double*(m: ptr as_map, k: cstring, v: cdouble): cint {.importc, header: asStringmapHeader.}
proc as_stringmap_set_str*(m: ptr as_map, k, v: cstring): cint {.importc, header: asStringmapHeader.}
proc as_stringmap_set_integer*(m: ptr as_map, k: cstring, v: ptr as_integer): cint {.importc, header: asStringmapHeader.}
proc as_stringmap_set_as_double*(m: ptr as_map, k: cstring, v: ptr as_double): cint {.importc, header: asStringmapHeader.}
proc as_stringmap_set_string*(m: ptr as_map, k: cstring, v: ptr as_string): cint {.importc, header: asStringmapHeader.}
proc as_stringmap_set_bytes*(m: ptr as_map, k: cstring, v: ptr as_bytes): cint {.importc, header: asStringmapHeader.}
proc as_stringmap_set_list*(m: ptr as_map, k: cstring, v: ptr as_list): cint {.importc, header: asStringmapHeader.}
proc as_stringmap_set_map*(m: ptr as_map, k: cstring, v: ptr as_map): cint {.importc, header: asStringmapHeader.}

proc as_stringmap_get*(m: ptr as_map, k: cstring): ptr as_val {.importc, header: asStringmapHeader.}
proc as_stringmap_get_int64*(m: ptr as_map, k: cstring): int64 {.importc, header: asStringmapHeader.}
proc as_stringmap_get_double*(m: ptr as_map, k: cstring): cdouble {.importc, header: asStringmapHeader.}
proc as_stringmap_get_str*(m: ptr as_map, k: cstring): cstring {.importc, header: asStringmapHeader.}
proc as_stringmap_get_integer*(m: ptr as_map, k: cstring): ptr as_integer {.importc, header: asStringmapHeader.}
proc as_stringmap_get_as_double*(m: ptr as_map, k: cstring): ptr as_double {.importc, header: asStringmapHeader.}
proc as_stringmap_get_string*(m: ptr as_map, k: cstring): ptr as_string {.importc, header: asStringmapHeader.}
proc as_stringmap_get_bytes*(m: ptr as_map, k: cstring): ptr as_bytes {.importc, header: asStringmapHeader.}
proc as_stringmap_get_list*(m: ptr as_map, k: cstring): ptr as_list {.importc, header: asStringmapHeader.}
proc as_stringmap_get_map*(m: ptr as_map, k: cstring): ptr as_map {.importc, header: asStringmapHeader.}