import ../../utils, types/as_rec, ../citrusleaf/cf_clock

const asAerospikeHeader* = "aerospike/as_aerospike.h"

type
  as_aerospike* {.importc: "struct aerospike_s", header: asAerospikeHeader.} = object
    source*: pointer
    hooks*: ptr as_aerospike_hooks
    is_rcalloc*: bool
  as_aerospike_hooks* {.importc: "struct aerospike_s", header: asAerospikeHeader.} = object
    destroy*: proc (a: ptr as_aerospike): void {.cdecl.}

    rec_create*: proc (a: ptr as_aerospike, r: ptr as_rec): cint {.cdecl.}
    rec_update*: proc (a: ptr as_aerospike, r: ptr as_rec): cint {.cdecl.}
    rec_remove*: proc (a: ptr as_aerospike, r: ptr as_rec): cint {.cdecl.}
    rec_exists*: proc (a: ptr as_aerospike, r: ptr as_rec): cint {.cdecl.}

    log*: proc (a: ptr as_aerospike, name: cstring, line, lvl: cint, msg: cstring): cint {.cdecl.}
    get_current_time*: proc (a: ptr as_aerospike): cf_clock {.cdecl.}
    set_context*: proc (a: ptr as_aerospike, r: ptr as_rec, context: uint32): int {.cdecl.}
    get_config*: proc (a: ptr as_aerospike, r: ptr as_rec, name: cstring)

proc as_aerospike_init*(a: ptr as_aerospike, source: pointer, hooks: ptr as_aerospike_hooks): ptr as_aerospike {.importc, dynlib: asLibName.}
proc as_aerospike_new*(source: pointer, hooks: ptr as_aerospike_hooks): ptr as_aerospike {.importc, dynlib: asLibName.}
proc as_aerospike_destroy*(a: ptr as_aerospike): void {.importc, dynlib: asLibName.}

proc as_aerospike_rec_create*(a: ptr as_aerospike, r: ptr as_rec): cint {.importc, dynlib: asLibName.}
proc as_aerospike_rec_update*(a: ptr as_aerospike, r: ptr as_rec): cint {.importc, dynlib: asLibName.}
proc as_aerospike_rec_exists*(a: ptr as_aerospike, r: ptr as_rec): cint {.importc, dynlib: asLibName.}
proc as_aerospike_rec_remove*(a: ptr as_aerospike, r: ptr as_rec): cint {.importc, dynlib: asLibName.}
proc as_aerospike_log*(a: ptr as_aerospike, name: cstring, line, lvl: cint, msg: cstring): cint {.importc, dynlib: asLibName.}
proc as_aerospike_get_current_time*(a: ptr as_aerospike): cf_clock {.importc, dynlib: asLibName.}
proc as_aerospike_set_context*(a: ptr as_aerospike, r: ptr as_rec, context: uint32): int {.importc, dynlib: asLibName.}
proc as_aerospike_get_config*(a: ptr as_aerospike, r: ptr as_rec, name: cstring) {.importc, dynlib: asLibName.}