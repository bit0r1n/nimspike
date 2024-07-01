import ../utils, as_val

const asIteratorHeader* = "aerospike/as_iterator.h"

type
  as_iterator* {.importc: "struct as_iterator_s", header: asIteratorHeader.} = object
    free*: bool
    data*: pointer
    hooks*: ptr as_iterator_hooks
  as_iterator_hooks* {.importc: "struct as_iterator_hooks_s", header: asIteratorHeader.} = object
    destroy*: proc (`iterator`: ptr as_iterator): bool {.cdecl.}
    has_next*: proc (`iterator`: ptr as_iterator): bool {.cdecl.}
    next*: proc (`iterator`: ptr as_iterator): ptr as_val {.cdecl.}

proc as_iterator_init*(`iterator`: ptr as_iterator, free: bool, data: pointer, hooks: ptr as_iterator_hooks): ptr as_iterator {.importc, dynlib: getLibName().}

proc as_iterator_destroy*(`iterator`: ptr as_iterator): void {.importc, dynlib: getLibName().}

proc as_iterator_has_next*(`iterator`: ptr as_iterator): bool {.importc, dynlib: getLibName().}
proc as_iterator_next*(`iterator`: ptr as_iterator): ptr as_val {.importc, dynlib: getLibName().}
