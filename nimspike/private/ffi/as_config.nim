import common/as_vector, utils

const asConfigHeader* = "aerospike/as_config.h"

type
  as_addr_map* {.importc: "struct as_addr_map_s", header: asConfigHeader.} = object
    orig*: cstring
    alt*: cstring
  as_auth_mode* {.importc: "enum as_auth_mode_e", header: asConfigHeader.} = enum
    AS_AUTH_INTERNAL
    AS_AUTH_EXTERNAL
    AS_AUTH_EXTERNAL_INSECURE
    AS_AUTH_PKI
  as_cluster_event_type* {.importc: "enum as_cluster_event_type_e", header: asConfigHeader.} = enum
    AS_CLUSTER_ADD_NODE
    AS_CLUSTER_REMOVE_NODE
    AS_CLUSTER_DISCONNECTED
  as_cluster_event* {.importc: "struct as_cluster_event_s", header: asConfigHeader.} = object
    node_name*: cstring
    node_address*: cstring
    udata*: pointer
    `type`*: as_cluster_event_type
  # as_cluster_event_callback* = proc (event: as_cluster_event): void
  as_config* {.importc: "struct as_config_s", header: asConfigHeader.} = object
    hosts*: as_vector_ptr
    user*, password*: cstring
    cluster_name*: cstring
    # event_callback (proc)
    # event_callback_udata
    ip_map*: ptr UncheckedArray[as_addr_map]
    ip_map_size*: uint32
    min_conns_per_node*, max_conns_per_node*,
      async_min_conns_per_node*, async_max_conns_per_node*,
      pipe_max_conns_per_node*,
      conn_pools_per_node*,
      conn_timeout_ms*,
      login_timeout_ms*,
      max_socket_idle*,
      max_error_rate*,
      error_rate_window*,
      tender_interval*,
      thread_pool_size*: uint32
    tend_thread_cpu*: cint
    # policies
    lua*: as_config_lua
    auth_mode*: as_auth_mode
    fail_if_not_connected*, use_services_alternate*, rack_aware*: bool
    rack_id*: cint
    rack_ids*: as_vector_ptr
    use_shm*: bool
    shm_key*: cint
    shm_max_nodes*, shm_max_namespaces*, shm_takeover_threshold_sec*: uint32
  as_config_ptr* = ptr as_config

  as_config_lua* {.importc: "sfail_if_not_connectedtruct as_config_lua_s", header: asConfigHeader.} = object
    cache_enabled*: bool
    user_path*: cstring
  as_config_lua_ptr* = ptr as_config_lua

# init
proc as_config_init*(config: as_config_ptr): void {.importc, dynlib: getLibName().}

# hosts
proc as_config_add_hosts*(config: as_config_ptr, hosts: cstring, default_port: uint16): bool {.importc, header: asConfigHeader.}
proc as_config_add_host*(config: as_config_ptr, host: cstring, port: uint16): void {.importc, header: asConfigHeader.}
proc as_config_clear_hosts*(config: as_config_ptr): void {.importc, header: asConfigHeader.}

# user
proc as_config_set_user*(config: as_config_ptr, user: cstring, password: cstring): bool {.importc, header: asConfigHeader.}

# cluster
proc as_config_set_cluster_name*(config: as_config_ptr, cluster_name: cstring): void {.importc, header: asConfigHeader.}
# proc as_config_set_cluster_event_callback*(config: as_config_ptr, callback: as_cluster_event_callback, udata: pointer): void {.importc, header: asConfigHeader.}

# lua
proc as_config_lua_init*(lua: as_config_lua_ptr): void {.importc, header: asConfigHeader.}

# tls
proc as_config_tls_set_cafile*(config: as_config_ptr, cafile: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_castring*(config: as_config_ptr, castring: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_capath*(config: as_config_ptr, capath: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_protocols*(config: as_config_ptr, protocols: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_cipher_suite*(config: as_config_ptr, cipher_suite: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_cert_blacklist*(config: as_config_ptr, cert_blacklist: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_keyfile*(config: as_config_ptr, keyfile: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_keyfile_pw*(config: as_config_ptr, pw: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_keystring*(config: as_config_ptr, keystring: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_certfile*(config: as_config_ptr, certfile: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_set_certstring*(config: as_config_ptr, certfile: cstring): void {.importc, header: asConfigHeader.}
proc as_config_tls_add_host*(config: as_config_ptr, address: cstring, tls_name: cstring, port: uint16): void {.importc, header: asConfigHeader.}
proc as_config_add_rack_id*(config: as_config_ptr, rack_id: cint): void {.importc, header: asConfigHeader.}
