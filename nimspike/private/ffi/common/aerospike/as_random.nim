import ../../utils

const asRandomHeader* = "aerospike/as_random.h"

type
  as_random* {.importc: "struct as_random_s", header: asRandomHeader.} = object
    seed0*, seed1*: uint64
    initialized*: bool

proc as_random_init*(random: ptr as_random): void {.importc, dynlib: asLibName.}
proc as_random_instance*(): ptr as_random {.importc, dynlib: asLibName.}
proc as_random_next_uint64*(random: ptr as_random): uint64 {.importc, dynlib: asLibName.}
proc as_random_next_uint32*(random: ptr as_random): uint32 {.importc, dynlib: asLibName.}
proc as_random_get_uint64*(): uint64 {.importc, dynlib: asLibName.}
proc as_random_get_uint32*(): uint32 {.importc, dynlib: asLibName.}
proc as_random_next_bytes*(random: ptr as_random, bytes: ptr uint8, len: uint32): void {.importc, dynlib: asLibName.}
proc as_random_get_bytes*(bytes: ptr uint8, len: uint32): void {.importc, dynlib: asLibName.}
proc as_random_next_str*(random: ptr as_random, str: cstring, len: uint32): void {.importc, dynlib: asLibName.}
proc as_random_get_str*(str: cstring, len: uint32): void {.importc, dynlib: asLibName.}