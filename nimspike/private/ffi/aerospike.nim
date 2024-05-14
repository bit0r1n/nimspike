import as_config, as_error, as_status
import utils

const asAerospikeHeader = "aerospike/aerospike.h"

type
  aerospike* {.importc: "struct aerospike_s", header: asAerospikeHeader.} = object
    # cluster
    config*: as_config
    free* {.importc: "_free".}: bool

proc aerospike_init*(asp: ptr aerospike, config: ptr as_config): ptr aerospike {.importc, dynlib: getLibName().}
proc aerospike_new*(config: ptr as_config): ptr aerospike {.importc, dynlib: getLibName().}
proc aerospike_init_lua*(config: ptr as_config_lua): void {.importc, dynlib: getLibName().}
proc aerospike_destroy*(asp: ptr aerospike): void {.importc, dynlib: getLibName().}
proc aerospike_connect*(asp: ptr aerospike, err: ptr as_error): as_status {.importc, dynlib: getLibName().}
proc aerospike_close*(asp: ptr aerospike, err: ptr as_error): as_status {.importc, dynlib: getLibName().}
proc aerospike_cluster_is_connected*(asp: ptr aerospike): bool {.importc, dynlib: getLibName().}
proc aerospike_stop_on_interrupt*(stop: bool): void {.importc, dynlib: getLibName().}
# proc aerospike_truncate*(asp: ptr aerospike, err: ptr as_error, policy: ptr as_policy_info, ns, set: cstring, before_nanos: uint64): as_status {.importc, dynlib: getLibName().}
# proc aerospike_reload_tls_config*(asp: ptr aerospike, err: ptr as_error): as_status {.importc, dynlib: getLibName().}
# proc aerospike_set_xdr_filter*(asp: ptr aerospike, err: ptr as_error, policy: ptr as_policy_info, dc, ns, filter_b64: cstring): as_status {.importc, dynlib: getLibName().}