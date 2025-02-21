when defined(windows):
  const asLibName* = "aerospike.dll"
elif defined(macosx):
  const asLibName* = "libaerospike.dylib"
else:
  const asLibName* = "libaerospike.so"