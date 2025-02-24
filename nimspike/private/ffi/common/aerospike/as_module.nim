import ../../utils, as_aerospike, as_udf_context, types/[ as_rec, as_list, as_result, as_stream ]

const asModuleHeader = "aerospike/as_module.h"

type
  as_module_event_type* {.importc: "enum as_module_event_type_e", header: asModuleHeader.} = enum
    AS_MODULE_EVENT_CONFIGURE
    AS_MODULE_EVENT_FILE_SCAN
    AS_MODULE_EVENT_FILE_ADD
    AS_MODULE_EVENT_FILE_REMOVE
    AS_MODULE_EVENT_CLEAR_CACHE
  as_module_event_data* {.importc: "struct as_module_event_data_s", header: asModuleHeader.} = object
    config*: pointer
    filename*: cstring
  as_module_event* {.importc: "struct as_module_event_s", header: asModuleHeader.} = object
    `type`*: as_module_event_type
    data*: as_module_event_data
  as_module_error* {.importc: "struct as_module_error_s", header: asModuleHeader.} = object
    scope*: uint8
    code*, line*: uint32
    file*, `func`*, message*: cstring
  as_module* {.importc: "struct as_module_s", header: asModuleHeader.} = object
    source*: pointer
    hooks*: as_module_hooks
  as_module_hooks* {.importc: "struct as_module_hooks_s", header: asModuleHeader.} = object
    destroy*: proc (m: ptr as_module): int {.cdecl.}
    update*: proc (m: ptr as_module, e: ptr as_module_event): int {.cdecl.}
    validate*: proc (m: ptr as_module, `as`: ptr as_aerospike, filename, content: cstring, size: uint32, err: ptr as_module_error): int {.cdecl.}
    apply_record*: proc (m: ptr as_module, ctx: ptr as_udf_context, filename, function: cstring, rec: ptr as_rec, args: ptr as_list, res: ptr as_result): int {.cdecl.}
    apply_stream*: proc (m: ptr as_module, ctx: ptr as_udf_context, filename, function: cstring, istream: ptr as_stream, args: ptr as_list, ostream: ptr as_stream, res: ptr as_result): int {.cdecl.}

proc as_module_source*(m: ptr as_module): pointer {.importc, dynlib: asLibName.}
proc as_module_destroy*(m: ptr as_module): cint {.importc, dynlib: asLibName.}
proc as_module_configure*(m: ptr as_module, c: pointer): cint {.importc, dynlib: asLibName.}
proc as_module_update*(m: ptr as_module, e: ptr as_module_event): cint {.importc, dynlib: asLibName.}
proc as_module_validate*(m: ptr as_module, `as`: ptr as_aerospike, filename, content: cstring, size: uint32, error: ptr as_module_error): cint {.importc, dynlib: asLibName.}
proc as_module_apply_record*(m: ptr as_module, ctx: ptr as_udf_context, filename, function: cstring, r: ptr as_rec, args: ptr as_list, res: ptr as_result): cint {.importc, dynlib: asLibName.}
proc as_module_apply_stream*(m: ptr as_module, ctx: ptr as_udf_context, filename, function: cstring, istream: ptr as_stream, args: ptr as_list, ostream: ptr as_stream, res: ptr as_result): cint {.importc, dynlib: asLibName.}
proc as_module_err_string*(e: cint): cstring {.importc, dynlib: asLibName.}
