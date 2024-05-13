import utils

const asHostHeader* = "aerospike/as_host.h"

type
  as_host* {.importc: "struct as_host_s", header: asHostHeader.} = object
    name*, tls_name*: cstring
    port*: uint16
  as_host_ptr* = ptr as_host

proc as_host_copy*(src, trg: as_host_ptr): void {.importc, dynlib: getLibName().}
proc as_host_copy_fields*(trg: as_host_ptr, hostname, tls_name: cstring, port: uint16): void {.importc, dynlib: getLibName().}
proc as_host_destroy*(host: as_host_ptr): void {.importc, dynlib: getLibName().}