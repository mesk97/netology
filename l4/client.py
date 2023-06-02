#!/usr/bin/env python

import socket
import sys

HOST = str(sys.argv[1])
PORT = int(sys.argv[2])

# socket.socket(family, type,
#  family: socket.AF_UNIX, socket.AF_INET, socket.AF_INET6
#  type:  socket.SOCK_STREAM, socket.SOCK_DGRAM, socket.SOCK_RAW
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect((HOST, PORT))

s.send(b"ping\n")

data = s.recv(1024)
print ("from %s: %s" % (str(s.getpeername()), data))

s.close()
