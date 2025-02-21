import ../../utils, openssl

proc as_tls_match_name(x509: ptr PX509, name: cstring, allow_wildcard: bool): bool {.importc, dynlib: asLibName.}

when not defined(windows):
  proc as_tls_match_san*(x509: ptr PX509, name: cstring): bool {.importc, dynlib: asLibName.}