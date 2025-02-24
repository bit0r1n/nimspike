import ../../utils

const asStringBuilderHeader = "aerospike/as_string_builder.h"

type
  as_string_builder* {.importc: "struct as_string_builder_s", header: asStringBuilderHeader.} = object
    data*: cstring
    capacity*, length*: uint32
    resize*, free*: bool

proc as_string_builder_inita*(sb: ptr as_string_builder, capacity: uint32, resize: bool): void {.importc, dynlib: asLibName.}
proc as_string_builder_init*(sb: ptr as_string_builder, capacity: uint32, resize: bool): void {.importc, dynlib: asLibName.}
proc as_string_builder_assign*(sb: ptr as_string_builder, buffer_size: uint32, data: cstring): void {.importc, header: asStringBuilderHeader.}
proc as_string_builder_destroy*(sb: ptr as_string_builder): void {.importc, dynlib: asLibName.}
proc as_string_builder_reset*(sb: ptr as_string_builder): void {.importc, header: asStringBuilderHeader.}
proc as_string_builder_append*(sb: ptr as_string_builder, value: cstring): bool {.importc, dynlib: asLibName.}
proc as_string_builder_append_char*(sb: ptr as_string_builder, value: char): bool {.importc, dynlib: asLibName.}
proc as_string_builder_append_bytes*(sb: ptr as_string_builder, src: ptr uint8, size: uint32): bool {.importc, dynlib: asLibName.}
proc as_string_builder_append_int*(sb: ptr as_string_builder, value: cint): bool {.importc, dynlib: asLibName.}
proc as_string_builder_append_uint*(sb: ptr as_string_builder, value: uint32): bool {.importc, dynlib: asLibName.}
proc as_string_builder_append_int64*(sb: ptr as_string_builder, value: int64): bool {.importc, dynlib: asLibName.}
proc as_string_builder_append_uint64*(sb: ptr as_string_builder, value: uint64): bool {.importc, dynlib: asLibName.}
proc as_string_builder_append_newline*(sb: ptr as_string_builder): bool {.importc, header: asStringBuilderHeader.}