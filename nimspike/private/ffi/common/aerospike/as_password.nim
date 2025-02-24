import ../../utils

const asPasswordHeader = "aerospike/as_password.h"

proc as_password_gen_salt*(salt: ptr UncheckedArray[char]): bool {.importc, dynlib: asLibName.}
proc as_password_gen_hash*(password, salt, hash: ptr UncheckedArray[char]): bool {.importc, dynlib: asLibName.}
proc as_password_gen_constant_hash*(password, hash: ptr UncheckedArray[char]): bool {.importc, dynlib: asLibName.}
proc as_password_get_constant_hash*(password, hash: ptr UncheckedArray[char]): bool {.importc, dynlib: asLibName.}
proc as_password_prompt_hash*(password, hash: ptr UncheckedArray[char]): bool {.importc, dynlib: asLibName.}
proc as_password_acquire*(password_trg: ptr UncheckedArray[char], password_src: cstring, size: cint): void {.importc, dynlib: asLibName.}
proc as_password_verify*(hash1, hash2: cstring): bool {.importc, header: asPasswordHeader.}