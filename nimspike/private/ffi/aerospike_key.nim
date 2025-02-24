import aerospike, as_error, as_policy, as_key, as_record, as_status
import utils

const asAerospikeKeyHeader = "aerospike/aerospike_key.h"

proc aerospike_key_get*(`as`: ptr aerospike, err: ptr as_error, policy: ptr as_policy_read, key: ptr as_key, rec: ptr ptr as_record): as_status {.importc, dynlib: asLibName.}
proc aerospike_key_put*(`as`: ptr aerospike, err: ptr as_error, policy: ptr as_policy_write, key: ptr as_key, rec: ptr as_record): as_status {.importc, dynlib: asLibName.}