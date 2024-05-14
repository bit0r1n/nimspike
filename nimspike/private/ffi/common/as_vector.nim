import ../utils

const asVectorHeader* = "aerospike/as_vector.h"

type
  as_vector* {.importc: "struct as_vector_s", header: asVectorHeader.} = object
    list*: pointer
    capacity*: uint32
    size*: uint32
    item_size*: uint32
    flags*: uint32

proc as_vector_init*(vector: ptr as_vector, item_size, capacity: uint32): void {.importc, dynlib: getLibName().}

proc as_vector_create*(item_size, capacity: uint32): ptr as_vector {.importc, dynlib: getLibName().}
proc as_vector_destroy*(vector: ptr as_vector): void {.importc, dynlib: getLibName().}
proc as_vector_clear*(vector: ptr as_vector): void {.importc, dynlib: getLibName().}

proc as_vector_get*(vector: ptr as_vector, index: uint32): pointer {.importc, dynlib: getLibName().}
proc as_vector_get_ptr*(vector: ptr as_vector, index: uint32): pointer {.importc, dynlib: getLibName().}

proc as_vector_increase_capacity*(vector: ptr as_vector): void {.importc, dynlib: getLibName().}

proc as_vector_set*(vector: ptr as_vector, index: uint32, value: pointer): void {.importc, dynlib: getLibName().}
proc as_vector_append*(vector: ptr as_vector, value: pointer): void {.importc, dynlib: getLibName().}
proc as_vector_append_unique*(vector: ptr as_vector, value: pointer): void {.importc, dynlib: getLibName().}

proc as_vector_to_array*(vector: ptr as_vector, size: uint32): pointer {.importc, dynlib: getLibName().}

proc as_vector_reserve*(vector: ptr as_vector): pointer {.importc, dynlib: getLibName().}

proc as_vector_remove*(vector: ptr as_vector, index: uint32): bool {.importc, dynlib: getLibName().}