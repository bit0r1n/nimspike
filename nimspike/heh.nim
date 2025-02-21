{.passL: "-lssl -luv -lm -lz -laerospike".}

import private/ffi/[aerospike, as_config, as_error, as_status]

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
else:
  echo connectError