import ../../utils, ./types/[ as_val ], ./as_buffer

const asSerializerHeader* = "aerospike/as_serializer.h"

type
  as_serializer* {.importc: "struct as_serializer_s" header: asSerializerHeader.} = object
    free*: bool
    hooks: ptr as_serializer_hooks
  as_serializer_hooks* {.importc: "struct as_serializer_hooks" header: asSerializerHeader.} = object
    destroy*: proc (serializer: ptr as_serializer): void {.cdecl.}
    serialize*: proc (serializer: ptr as_serializer, val: ptr as_val, buffer: ptr as_buffer): cint {.cdecl.}
    serialize_presized*: proc (serializer: ptr as_serializer, val: ptr as_val, buf: ptr uint8): int32 {.cdecl.}
    deserialize*: proc (serializer: ptr as_serializer, buffer: ptr as_buffer, val: ptr UncheckedArray[ptr as_val]): cint {.cdecl.}
    serialize_getsize*: proc (serializer: ptr as_serializer, val: ptr as_val): uint32 {.cdecl.}

proc as_serializer_cons*(serializer: ptr as_serializer, free: bool, hooks: ptr as_serializer_hooks): ptr as_serializer {.importc, dynlib: asLibName.}
proc as_serializer_init*(serializer: ptr as_serializer, hooks: ptr as_serializer_hooks): ptr as_serializer {.importc, dynlib: asLibName.}
proc as_serializer_new*(hooks: ptr as_serializer_hooks): ptr as_serializer {.importc, dynlib: asLibName.}
proc as_serializer_destroy*(serializer: ptr as_serializer): void {.importc, dynlib: asLibName.}

proc as_serializer_serialize*(serializer: ptr as_serializer, val: ptr as_val, buffer: ptr as_buffer): cint {.importc, dynlib: asLibName.}
proc as_serializer_serialize_presized*(serializer: ptr as_serializer, val: ptr as_val, buf: ptr uint8): int32 {.importc, dynlib: asLibName.}
proc as_serializer_deserialize*(serializer: ptr as_serializer, buffer: ptr as_buffer, val: ptr UncheckedArray[ptr as_val]): cint {.importc, dynlib: asLibName.}
proc as_serializer_serialize_getsize*(serializer: ptr as_serializer, val: ptr as_val): uint32 {.importc, dynlib: asLibName.}