import as_aerospike, as_timer

const asUdfContextHeader = "aerospike/as_udf_context.h"

type as_udf_context* {.importc: "struct as_udf_context_s", header: asUdfContextHeader.} = object
  `as`*: ptr as_aerospike
  timer*: ptr as_timer