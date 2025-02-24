import utils, as_record, as_bin

const asRecordIteratorHeader = "aerospike/as_record_iterator.h"

type
  as_record_iterator* {.importc: "struct as_record_iterator_s", header: asRecordIteratorHeader.} = object
    free* {.importc: "_free".}: bool
    record*: ptr as_record
    pos*: uint32

proc as_record_iterator_new*(record: ptr as_record): ptr as_record_iterator {.importc, dynlib: asLibName.}
proc as_record_iterator_init*(`iterator`: ptr as_record_iterator, record: ptr as_record): ptr as_record_iterator {.importc, dynlib: asLibName.}
proc as_record_iterator_destroy*(`iterator`: ptr as_record_iterator): void {.importc, dynlib: asLibName.}
proc as_record_iterator_has_next*(`iterator`: ptr as_record_iterator): bool {.importc, dynlib: asLibName.}
proc as_record_iterator_next*(`iterator`: ptr as_record_iterator): ptr as_bin {.importc, dynlib: asLibName.}