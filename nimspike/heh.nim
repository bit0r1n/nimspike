{.passL: "-lssl -luv -lm -lz -laerospike".}

import private/ffi/[aerospike, as_config, as_error, as_status, as_key, as_record, as_record_iterator, aerospike_key, as_bin ]
import private/ffi/common/aerospike/types/as_val
import strformat

var config: as_config
as_config_init(addr config)

as_config_add_host(addr config, "localhost", 3000)

proc clusterLogger(event: ptr as_cluster_event) {.cdecl.} =
  echo event[]

as_config_set_cluster_event_callback(addr config, clusterLogger, nil)

var client: aerospike
discard aerospike_init(addr client, addr config)

var connectError: as_error
let connectStatus = aerospike_connect(addr client, addr connectError)

if connectStatus == AEROSPIKE_OK:
  echo "connected"

  var key = as_key_new("test", "testset", "heh")[]

  echo "putting record"
  var
    putRec = as_record_new(2)[]
    putError: as_error
  discard as_record_set_strp(addr putRec, "str_bin", "babube", true)
  discard as_record_set_int64(addr putRec, "int64_bin", 222333888222333888.int64)
  echo "status of writing record ", aerospike_key_put(addr client, addr putError, nil, addr key, addr putRec)

  echo "getting record"
  var
    rec: ptr as_record = nil
    getError: as_error

  echo "status of getting record ", aerospike_key_get(addr client, addr getError, nil, addr key, addr rec)
  if getError.code == AEROSPIKE_OK:
    var rIt = as_record_iterator_new(rec)

    while as_record_iterator_has_next(rIt):
      let
        bin = as_record_iterator_next(rIt)
        binName = as_bin_get_name(bin)
        binValue = as_bin_get_value(bin)
      echo fmt"{binName}[{as_val_type_e(as_bin_get_type(bin))}]: {as_val_tostring(cast[ptr as_val](binValue))}"

else:
  echo connectError