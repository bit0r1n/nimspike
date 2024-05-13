import as_config, as_error, as_status
import utils

const asAerospikeHeader = "aerospike/aerospike.h"

type
  aerospike* {.importc: "struct aerospike_s", header: asAerospikeHeader.} = object
    # cluster
    config*: as_config
    free* {.importc: "_free".}: bool
  aerospike_ptr* = ptr aerospike

proc aerospike_init*(asp: aerospike_ptr, config: as_config_ptr): aerospike_ptr {.importc, dynlib: getLibName().}
proc aerospike_new*(config: as_config_ptr): aerospike_ptr {.importc, dynlib: getLibName().}
proc aerospike_init_lua*(config: as_config_lua_ptr): void {.importc, dynlib: getLibName().}
proc aerospike_destroy*(asp: aerospike_ptr): void {.importc, dynlib: getLibName().}
proc aerospike_connect*(asp: aerospike_ptr, err: as_error_ptr): as_status {.importc, dynlib: getLibName().}
proc aerospike_close*(asp: aerospike_ptr, err: as_error_ptr): as_status {.importc, dynlib: getLibName().}
proc aerospike_cluster_is_connected*(asp: aerospike_ptr): bool {.importc, dynlib: getLibName().}
proc aerospike_stop_on_interrupt*(stop: bool): void {.importc, dynlib: getLibName().}
# proc aerospike_truncate*(asp: aerospike_ptr, err: as_error_ptr, policy: as_policy_info_ptr, ns, set: cstring, before_nanos: uint64): as_status {.importc, dynlib: getLibName().}
# proc aerospike_reload_tls_config*(asp: aerospike_ptr, err: as_error_ptr): as_status {.importc, dynlib: getLibName().}
# proc aerospike_set_xdr_filter*(asp: aerospike_ptr, err: as_error_ptr, policy: as_policy_info_ptr, dc, ns, filter_b64: cstring): as_status {.importc, dynlib: getLibName().}