#!/usr/bin/env python
import sys
with open(sys.argv[1]) as fd_in:
    data = fd_in.read().replace(sys.argv[2], sys.argv[3].decode('string_escape'))
    with open(sys.argv[1], "w") as fd_out:
        fd_out.write(data)

