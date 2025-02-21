import ../../utils, as_serializer

const asMsgpackSerializerHeader* = "aerospike/as_msgpack_serializer.h"

proc as_msgpack_new*(): ptr as_serializer {.importc, dynlib: asLibName.}
proc as_msgpack_init*(s: ptr as_serializer): ptr as_serializer {.importc, dynlib: asLibName.}