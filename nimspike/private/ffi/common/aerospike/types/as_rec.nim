import ../../../utils, as_val, as_bytes, as_integer, as_double, as_geojson, as_map, as_string, as_list

const asRecHeader* = "aerospike/as_rec.h"

type
  as_rec_bin_names_callback* = proc (bin_names: cstring, nbins: uint32, max_name_size: uint16, udata: pointer): void
  as_rec_foreach_callback* = proc (name: cstring, value: ptr as_val, udata: pointer): bool
  as_rec* {.importc: "struct as_rec_s", header: asRecHeader.} = object
    `_`*: as_val
    data*: pointer
    hooks*: ptr as_rec_hooks
  as_rec_hooks* {.importc: "struct as_rec_hooks_s", header: asRecHeader.} = object
    destroy*: proc (rec: ptr as_rec): bool {.cdecl.}
    hashcode*: proc (rec: ptr as_rec): uint32 {.cdecl.}
    get*: proc (rec: ptr as_rec, name: cstring): ptr as_val {.cdecl.}
    set*: proc (rec: ptr as_rec, name: cstring, value: ptr as_val): cint {.cdecl.}
    remove*: proc (rec: ptr as_rec, bin: cstring): cint {.cdecl.}
    ttl*: proc (rec: ptr as_rec): uint32 {.cdecl.}
    last_update_time*: proc (rec: ptr as_rec): uint64 {.cdecl.}
    gen*: proc (rec: ptr as_rec): uint16 {.cdecl.}
    size*: proc (rec: ptr as_rec): uint32 {.cdecl.}
    memory_size*: proc (rec: ptr as_rec): uint32 {.cdecl.}
    device_size*: proc (rec: ptr as_rec): uint32 {.cdecl.}
    key*: proc (rec: ptr as_rec): ptr as_val {.cdecl.}
    setname*: proc (rec: ptr as_rec): cstring {.cdecl.}
    numbins*: proc (rec: ptr as_rec): uint16 {.cdecl.}
    bin_names*: proc (rec: ptr as_rec, callback: as_rec_bin_names_callback, udata: pointer): cint {.cdecl.}
    digest*: proc (rec: ptr as_rec): ptr as_bytes {.cdecl.}
    set_ttl*: proc (rec: ptr as_rec, ttl: uint32): cint {.cdecl.}
    drop_key*: proc (rec: ptr as_rec): cint {.cdecl.}
    foreach*: proc (rec: ptr as_rec, callback: as_rec_foreach_callback, udata: pointer): bool {.cdecl.}

proc as_rec_cons*(rec: ptr as_rec, free: bool, data: pointer, hooks: ptr as_rec_hooks): ptr as_rec {.importc, dynlib: asLibName.}
proc as_rec_init*(rec: ptr as_rec, data: pointer, hooks: ptr as_rec_hooks): ptr as_rec {.importc, dynlib: asLibName.}
proc as_rec_new*(data: pointer, hooks: ptr as_rec_hooks): ptr as_rec {.importc, dynlib: asLibName.}
proc as_rec_destroy*(rec: ptr as_rec): void {.importc, dynlib: asLibName.}

proc as_rec_source*(rec: ptr as_rec): pointer {.importc, dynlib: asLibName.}
proc as_rec_remove*(rec: ptr as_rec, name: cstring): cint {.importc, dynlib: asLibName.}
proc as_rec_ttl*(rec: ptr as_rec): uint32 {.importc, dynlib: asLibName.}
proc as_rec_last_update_time*(rec: ptr as_rec): uint64 {.importc, dynlib: asLibName.}
proc as_rec_gen*(rec: ptr as_rec): uint16 {.importc, dynlib: asLibName.}
proc as_rec_size*(rec: ptr as_rec): uint32 {.importc, dynlib: asLibName.}
proc as_rec_memory_size*(rec: ptr as_rec): uint32 {.importc, dynlib: asLibName.}
proc as_rec_device_size*(rec: ptr as_rec): uint32 {.importc, dynlib: asLibName.}
proc as_rec_key*(rec: ptr as_rec): ptr as_val {.importc, dynlib: asLibName.}
proc as_rec_setname*(rec: ptr as_rec): cstring {.importc, dynlib: asLibName.}
proc as_rec_numbins*(rec: ptr as_rec): uint16 {.importc, dynlib: asLibName.}
proc as_rec_bin_names*(rec: ptr as_rec, callback: as_rec_bin_names_callback, udata: pointer): cint {.importc, dynlib: asLibName.}
proc as_rec_digest*(rec: ptr as_rec): ptr as_bytes {.importc, dynlib: asLibName.}
proc as_rec_set_ttl*(rec: ptr as_rec, ttl: uint32): int {.importc, dynlib: asLibName.}
proc as_rec_drop_key*(rec: ptr as_rec): int {.importc, dynlib: asLibName.}

proc as_rec_get*(rec: ptr as_rec, name: cstring): ptr as_val {.importc, dynlib: asLibName.}
proc as_rec_get_int64*(rec: ptr as_rec, name: cstring): int64 {.importc, dynlib: asLibName.}
proc as_rec_get_double*(rec: ptr as_rec, name: cstring): cdouble {.importc, dynlib: asLibName.}
proc as_rec_get_str*(rec: ptr as_rec, name: cstring): cstring {.importc, dynlib: asLibName.}
proc as_rec_get_geojson_str*(rec: ptr as_rec, name: cstring): cstring {.importc, dynlib: asLibName.}
proc as_rec_get_integer*(rec: ptr as_rec, name: cstring): ptr as_integer {.importc, dynlib: asLibName.}
proc as_rec_get_as_double*(rec: ptr as_rec, name: cstring): ptr as_double {.importc, dynlib: asLibName.}
proc as_rec_get_string*(rec: ptr as_rec, name: cstring): ptr as_string {.importc, dynlib: asLibName.}
proc as_rec_get_geojson*(rec: ptr as_rec, name: cstring): ptr as_geojson {.importc, dynlib: asLibName.}
proc as_rec_get_bytes*(rec: ptr as_rec, name: cstring): ptr as_bytes {.importc, dynlib: asLibName.}
proc as_rec_get_list*(rec: ptr as_rec, name: cstring): ptr as_list {.importc, dynlib: asLibName.}
proc as_rec_get_map*(rec: ptr as_rec, name: cstring): ptr as_map {.importc, dynlib: asLibName.}

proc as_rec_set*(rec: ptr as_rec, name: cstring, value: ptr as_val): cint {.importc, dynlib: asLibName.}
proc as_rec_set_int64*(rec: ptr as_rec, name: cstring, value: int64): cint {.importc, dynlib: asLibName.}
proc as_rec_set_double*(rec: ptr as_rec, name: cstring, value: cdouble): cint {.importc, dynlib: asLibName.}
proc as_rec_set_str*(rec: ptr as_rec, name: cstring, value: cstring): cint {.importc, dynlib: asLibName.}
proc as_rec_set_integer*(rec: ptr as_rec, name: cstring, value: ptr as_integer): cint {.importc, dynlib: asLibName.}
proc as_rec_set_as_double*(rec: ptr as_rec, name: cstring, value: ptr as_double): cint {.importc, dynlib: asLibName.}
proc as_rec_set_string*(rec: ptr as_rec, name: cstring, value: ptr as_string): cint {.importc, dynlib: asLibName.}
proc as_rec_set_geojson*(rec: ptr as_rec, name: cstring, value: ptr as_geojson): cint {.importc, dynlib: asLibName.}
proc as_rec_set_bytes*(rec: ptr as_rec, name: cstring, value: ptr as_bytes): cint {.importc, dynlib: asLibName.}
proc as_rec_set_list*(rec: ptr as_rec, name: cstring, value: ptr as_list): cint {.importc, dynlib: asLibName.}
proc as_rec_set_map*(rec: ptr as_rec, name: cstring, value: ptr as_map): cint {.importc, dynlib: asLibName.}

proc as_rec_foreach*(rec: ptr as_rec, callback: as_rec_foreach_callback, udata: pointer): bool {.importc, dynlib: asLibName.}

proc as_rec_toval*(rec: ptr as_rec): ptr as_val {.importc, dynlib: asLibName.}
proc as_rec_fromval*(v: ptr as_val): ptr as_rec {.importc, dynlib: asLibName.}

proc as_rec_val_destroy*(v: ptr as_val): void {.importc, dynlib: asLibName.}
proc as_rec_val_hashcode*(v: ptr as_val): uint32 {.importc, dynlib: asLibName.}
proc as_rec_val_tostring*(v: ptr as_val): cstring {.importc, dynlib: asLibName.}
