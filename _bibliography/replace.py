#!/usr/bin/env python3
import sys
with open(sys.argv[1]) as fd_in:
    data = fd_in.read().replace(sys.argv[2], sys.argv[3])
    with open(sys.argv[1], "w") as fd_out:
        fd_out.write(data)

