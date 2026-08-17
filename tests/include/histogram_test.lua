-- Minimal latency histogram test script.
-- Thread 0 sleeps 1s, thread 1 sleeps 2s, producing two distinct buckets.

local ffi = require("ffi")
ffi.cdef[[
  int usleep(unsigned int);
]]
function event()
  if (sysbench.tid == 0) then
    ffi.C.usleep(1000000)
  else
    ffi.C.usleep(2000000)
  end
end
