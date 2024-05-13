import ../utils

const asVectorHeader* = "aerospike/as_vector.h"

type
  as_vector* {.importc: "struct as_vector_s", header: asVectorHeader.} = object
    list*: pointer
    capacity*: uint32
    size*: uint32
    item_size*: uint32
    flags*: uint32
  as_vector_ptr* = ptr as_vector

proc as_vector_init*(vector: as_vector_ptr, item_size, capacity: uint32): void {.importc, dynlib: getLibName().}

proc as_vector_create*(item_size, capacity: uint32): as_vector_ptr {.importc, dynlib: getLibName().}
proc as_vector_destroy*(vector: as_vector_ptr): void {.importc, dynlib: getLibName().}
proc as_vector_clear*(vector: as_vector_ptr): void {.importc, dynlib: getLibName().}

proc as_vector_get*(vector: as_vector_ptr, index: uint32): pointer {.importc, dynlib: getLibName().}
proc as_vector_get_ptr*(vector: as_vector_ptr, index: uint32): pointer {.importc, dynlib: getLibName().}

proc as_vector_increase_capacity*(vector: as_vector_ptr): void {.importc, dynlib: getLibName().}

proc as_vector_set*(vector: as_vector_ptr, index: uint32, value: pointer): void {.importc, dynlib: getLibName().}
proc as_vector_append*(vector: as_vector_ptr, value: pointer): void {.importc, dynlib: getLibName().}
proc as_vector_append_unique*(vector: as_vector_ptr, value: pointer): void {.importc, dynlib: getLibName().}

proc as_vector_to_array*(vector: as_vector_ptr, size: uint32): pointer {.importc, dynlib: getLibName().}

proc as_vector_reserve*(vector: as_vector_ptr): pointer {.importc, dynlib: getLibName().}

proc as_vector_remove*(vector: as_vector_ptr, index: uint32): bool {.importc, dynlib: getLibName().}