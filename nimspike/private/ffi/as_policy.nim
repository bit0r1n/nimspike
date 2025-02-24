import utils

const asPolicyHeader = "aerospike/as_policy.h"

type
  as_policy_retry* {.importc: "enum as_policy_retry_e" header: asPolicyHeader.} = enum
    AS_POLICY_RETRY_NONE
    AS_POLICY_RETRY_ONCE
  as_policy_gen* {.importc: "enum as_policy_gen_e" header: asPolicyHeader.} = enum
    AS_POLICY_GEN_IGNORE
    AS_POLICY_GEN_EQ
    AS_POLICY_GEN_GT
  as_policy_key* {.importc: "enum as_policy_key_e" header: asPolicyHeader.} = enum
    AS_POLICY_KEY_DIGEST
    AS_POLICY_KEY_SEND
  as_policy_exists* {.importc: "enum as_policy_exists_e" header: asPolicyHeader.} = enum
    AS_POLICY_EXISTS_IGNORE
    AS_POLICY_EXISTS_CREATE
    AS_POLICY_EXISTS_UPDATE
    AS_POLICY_EXISTS_REPLACE
    AS_POLICY_EXISTS_CREATE_OR_REPLACE
  as_policy_replica* {.importc: "enum as_policy_replica_e" header: asPolicyHeader.} = enum
    AS_POLICY_REPLICA_MASTER
    AS_POLICY_REPLICA_ANY
    AS_POLICY_REPLICA_SEQUENCE
    AS_POLICY_REPLICA_PREFER_RACK
  as_policy_read_mode_ap* {.importc: "enum as_policy_read_mode_ap_e" header: asPolicyHeader.} = enum
    AS_POLICY_READ_MODE_AP_ONE
    AS_POLICY_READ_MODE_AP_ALL
  as_policy_read_mode_sc* {.importc: "enum as_policy_read_mode_sc_e" header: asPolicyHeader.} = enum
    AS_POLICY_READ_MODE_SC_SESSION
    AS_POLICY_READ_MODE_SC_LINEARIZE
    AS_POLICY_READ_MODE_SC_ALLOW_REPLICA
    AS_POLICY_READ_MODE_SC_ALLOW_UNAVAILABLE
  as_policy_commit_level* {.importc: "enum as_policy_commit_level_e" header: asPolicyHeader.} = enum
    AS_POLICY_COMMIT_LEVEL_ALL
    AS_POLICY_COMMIT_LEVEL_MASTER
  as_query_duration* {.importc: "enum as_query_duration_e" header: asPolicyHeader.} = enum
    AS_QUERY_DURATION_LONG
    AS_QUERY_DURATION_SHORT
    AS_QUERY_DURATION_LONG_RELAX_AP
  
  as_exp* {.importc: "struct as_exp", header: asPolicyHeader.} = object
  as_txn* {.importc: "struct as_txn", header: asPolicyHeader.} = object
  as_policy_base* {.importc: "struct as_policy_base_s", header: asPolicyHeader.} = object
    socket_timeout*, total_timeout*, max_retries*, sleep_between_retries*: uint32
    filter_exp*: ptr as_exp
    txn*: ptr as_txn
    compress*: bool
  as_policy_read* {.importc: "struct as_policy_read_s", header: asPolicyHeader.} = object
    base*: as_policy_base
    key*: as_policy_key
    replica*: as_policy_replica
    read_mode_ap*: as_policy_read_mode_ap
    read_mode_sc*: as_policy_read_mode_sc
    read_touch_ttl_percent*: cint
    deserialize*, async_heap_rec*: bool
  as_policy_write* {.importc: "struct as_policy_write_s", header: asPolicyHeader.} = object
    base*: as_policy_base
    key*: as_policy_key
    replica*: as_policy_replica
    commit_level*: as_policy_commit_level
    gen*: as_policy_gen
    exists*: as_policy_exists
    ttl*, compression_threshold*: uint32
    durable_delete*, on_locking_only*: bool
  as_policy_apply* {.importc: "struct as_policy_apply_s", header: asPolicyHeader.} = object
    base*: as_policy_base
    key*: as_policy_key
    replica*: as_policy_replica
    commit_level*: as_policy_commit_level
    ttl*: uint32
    durable_delete*, on_locking_only: bool
  as_policy_operate* {.importc: "struct as_policy_operate_s", header: asPolicyHeader.} = object
    base*: as_policy_base
    key*: as_policy_key
    replica*: as_policy_replica
    read_mode_ap*: as_policy_read_mode_ap
    read_mode_sc*: as_policy_read_mode_sc
    commit_level*: as_policy_commit_level
    gen*: as_policy_gen
    exists*: as_policy_exists
    ttl*: uint32
    read_touch_ttl_percent*: cint
    deserialize*, durable_delete*, on_locking_only*, async_heap_rec*, respond_all_ops*: bool
  as_policy_remove* {.importc: "struct as_policy_remove_s", header: asPolicyHeader.} = object
    base*: as_policy_base
    key*: as_policy_key
    replica*: as_policy_replica
    commit_level*: as_policy_commit_level
    gen*: as_policy_gen
    generation*: uint16
    durable_delete*: bool
  as_policy_batch* {.importc: "struct as_policy_batch_s", header: asPolicyHeader.} = object
    base*: as_policy_base
    replica*: as_policy_replica
    read_mode_ap*: as_policy_read_mode_ap
    read_mode_sc*: as_policy_read_mode_sc
    read_touch_ttl_percent*: cint
    concurrent*, allow_inline*, allow_inline_ssd*, respond_all_keys*, send_set_name*, deserialize*: bool
  as_policy_batch_read* {.importc: "struct as_policy_batch_read_s", header: asPolicyHeader.} = object
    filter_exp*: ptr as_exp
    read_mode_ap*: as_policy_read_mode_ap
    read_mode_sc*: as_policy_read_mode_sc
    read_touch_ttl_percent*: cint
  as_policy_batch_write* {.importc: "struct as_policy_batch_write_s", header: asPolicyHeader.} = object
    filter_exp*: ptr as_exp
    key*: as_policy_key
    commit_level*: as_policy_commit_level
    gen*: as_policy_gen
    exists*: as_policy_exists
    ttl*: uint32
    durable_delete*, on_locking_only*: bool
  as_policy_batch_apply* {.importc: "struct as_policy_batch_write_s", header: asPolicyHeader.} = object
    filter_exp*: ptr as_exp
    key*: as_policy_key
    commit_level*: as_policy_commit_level
    ttl*: uint32
    durable_delete*, on_locking_only*: bool
  as_policy_batch_remove* {.importc: "struct as_policy_batch_remove_s", header: asPolicyHeader.} = object
    filter_exp*: ptr as_exp
    key*: as_policy_key
    commit_level*: as_policy_commit_level
    gen*: as_policy_gen
    generation*: uint16
    durable_delete*: bool
  as_policy_query* {.importc: "struct as_policy_query_s", header: asPolicyHeader.} = object
    base*: as_policy_base
    info_timeout*: uint32
    replica*: as_policy_replica
    expected_duration*: as_query_duration
    fail_on_cluster_change*, deserialize*: bool
  as_policy_scan* {.importc: "struct as_policy_scan_s", header: asPolicyHeader.} = object
    base*: as_policy_base
    max_records*: uint64
    records_per_second*: uint32
    replica*: as_policy_replica
    ttl*: uint32
    durable_delete*: bool
  as_policy_info* {.importc: "struct as_policy_info_s", header: asPolicyHeader.} = object
    timeout*: uint32
    send_as_is*, check_bounds*: bool
  as_policy_admin* {.importc: "struct as_policy_admin_s", header: asPolicyHeader.} = object
    timeout*: uint32
  as_policy_txn_verify* = as_policy_batch
  as_policy_txn_roll* = as_policy_batch
  as_policies* {.importc: "struct as_policies_s", header: asPolicyHeader.} = object
    read*: as_policy_read
    write*: as_policy_write
    operate*: as_policy_operate
    remove*: as_policy_remove
    apply*: as_policy_apply
    batch*, batch_parent_write*: as_policy_batch
    batch_write*: as_policy_batch_write
    batch_apply*: as_policy_batch_apply
    batch_remove*: as_policy_batch_remove
    scan*: as_policy_scan
    query*: as_policy_query
    info*: as_policy_info
    admin*: as_policy_admin
    txn_verify*: as_policy_txn_verify
    txn_roll*: as_policy_txn_roll

const
  AS_POLICY_SOCKET_TIMEOUT_DEFAULT* = 30000
  AS_POLICY_TOTAL_TIMEOUT_DEFAULT* = 1000
  AS_POLICY_COMPRESSION_THRESHOLD_DEFAULT* = 0
  AS_POLICY_GEN_DEFAULT* = AS_POLICY_GEN_IGNORE
  AS_POLICY_KEY_DEFAULT* = AS_POLICY_KEY_DIGEST
  AS_POLICY_EXISTS_DEFAULT* = AS_POLICY_EXISTS_IGNORE
  AS_POLICY_REPLICA_DEFAULT* = AS_POLICY_REPLICA_SEQUENCE
  AS_POLICY_READ_MODE_AP_DEFAULT* = AS_POLICY_READ_MODE_AP_ONE
  AS_POLICY_READ_MODE_SC_DEFAULT* = AS_POLICY_READ_MODE_SC_SESSION
  AS_POLICY_COMMIT_LEVEL_DEFAULT* = AS_POLICY_COMMIT_LEVEL_ALL
  
proc as_policy_base_read_init*(p: ptr as_policy_base): void {.importc, dynlib: asLibName.}
proc as_policy_base_write_init*(p: ptr as_policy_base): void {.importc, dynlib: asLibName.}
proc as_policy_base_query_init*(p: ptr as_policy_base): void {.importc, dynlib: asLibName.}

proc as_policy_read_init*(p: ptr as_policy_read): ptr as_policy_read {.importc, dynlib: asLibName.}
proc as_policy_read_copy*(src, trg: ptr as_policy_read): void {.importc, dynlib: asLibName.}

proc as_policy_write_init*(p: ptr as_policy_write): ptr as_policy_write {.importc, dynlib: asLibName.}
proc as_policy_write_copy*(src, trg: ptr as_policy_write): void {.importc, dynlib: asLibName.}

proc as_policy_operate_init*(p: ptr as_policy_operate): ptr as_policy_operate {.importc, dynlib: asLibName.}
proc as_policy_operate_copy*(src, trg: ptr as_policy_operate): void {.importc, dynlib: asLibName.}

proc as_policy_remove_init*(p: ptr as_policy_remove): ptr as_policy_remove {.importc, dynlib: asLibName.}
proc as_policy_remove_copy*(src, trg: ptr as_policy_remove): void {.importc, dynlib: asLibName.}

proc as_policy_apply_init*(p: ptr as_policy_apply): ptr as_policy_apply {.importc, dynlib: asLibName.}
proc as_policy_apply_copy*(src, trg: ptr as_policy_apply): void {.importc, dynlib: asLibName.}

proc as_policy_batch_init*(p: ptr as_policy_batch): ptr as_policy_batch {.importc, dynlib: asLibName.}
proc as_policy_batch_parent_write_init*(p: ptr as_policy_batch): ptr as_policy_batch {.importc, dynlib: asLibName.}
proc as_policy_batch_copy*(src, trg: ptr as_policy_batch): void {.importc, dynlib: asLibName.}

proc as_policy_batch_read_init*(p: ptr as_policy_batch_read): ptr as_policy_batch_read {.importc, dynlib: asLibName.}
proc as_policy_batch_write_init*(p: ptr as_policy_batch_write): ptr as_policy_batch_write {.importc, dynlib: asLibName.}
proc as_policy_batch_apply_init*(p: ptr as_policy_batch_apply): ptr as_policy_batch_apply {.importc, dynlib: asLibName.}
proc as_policy_batch_remove_init*(p: ptr as_policy_batch_remove): ptr as_policy_batch_remove {.importc, dynlib: asLibName.}

proc as_policy_scan_init*(p: ptr as_policy_scan): ptr as_policy_scan {.importc, dynlib: asLibName.}
proc as_policy_scan_copy*(src, trg: ptr as_policy_scan): void {.importc, dynlib: asLibName.}

proc as_policy_query_init*(p: ptr as_policy_query): ptr as_policy_query {.importc, dynlib: asLibName.}
proc as_policy_query_copy*(src, trg: ptr as_policy_query): void {.importc, dynlib: asLibName.}

proc as_policy_info_init*(p: ptr as_policy_info): ptr as_policy_info {.importc, dynlib: asLibName.}
proc as_policy_info_copy*(src, trg: ptr as_policy_info): void {.importc, dynlib: asLibName.}

proc as_policy_admin_init*(p: ptr as_policy_admin): ptr as_policy_admin {.importc, dynlib: asLibName.}
proc as_policy_admin_copy*(src, trg: ptr as_policy_admin): void {.importc, dynlib: asLibName.}

proc as_policy_txn_verify_init*(p: ptr as_policy_txn_verify): ptr as_policy_txn_verify {.importc, dynlib: asLibName.}
proc as_policy_txn_verify_copy*(src, trg: ptr as_policy_txn_verify): void {.importc, dynlib: asLibName.}

proc as_policy_txn_roll_init*(p: ptr as_policy_txn_roll): ptr as_policy_txn_roll {.importc, dynlib: asLibName.}
proc as_policy_txn_roll_copy*(src, trg: ptr as_policy_txn_roll): void {.importc, dynlib: asLibName.}

proc as_policies_init*(p: ptr as_policies): ptr as_policies {.importc, dynlib: asLibName.}
proc as_policies_destroy*(p: ptr as_policies): void {.importc, dynlib: asLibName.}