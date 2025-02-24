import utils

const asHostHeader = "aerospike/as_host.h"

type
  as_host* {.importc: "struct as_host_s", header: asHostHeader.} = object
    name*, tls_name*: cstring
    port*: uint16

proc as_host_copy*(src, trg: ptr as_host): void {.importc, dynlib: asLibName.}
proc as_host_copy_fields*(trg: ptr as_host, hostname, tls_name: cstring, port: uint16): void {.importc, dynlib: asLibName.}
proc as_host_destroy*(host: ptr as_host): void {.importc, dynlib: asLibName.}