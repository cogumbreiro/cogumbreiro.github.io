#!/usr/bin/env python3
import sys

# Standard fixes
replace = {
    "ﬀ": "f‌f",
    "ﬃ": "f‌f‌i",
    "ﬄ": "f‌f‌l",
    "ﬁ": "f‌i",
    "ﬂ": "f‌l",
}

key = None
for arg in sys.argv[2:]:
    if key is None:
        key = arg
    else:
        replace[key] = arg
        key = None

with open(sys.argv[1]) as fd_in:
    data = fd_in.read()
    for k,v in replace.items():
        if k in data:
            data = data.replace(k, v)

    with open(sys.argv[1], "w") as fd_out:
        fd_out.write(data)

