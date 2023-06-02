#!/usr/bin/env python

import socket
import select
import sys

HOST = str(sys.argv[1])
PORT = int(sys.argv[2])

l = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

l.bind((HOST, PORT))

l.listen()

slist = [l]

while True:
    read_sockets, write_sockets, error_sockets = select.select(slist, [], [])
    for s in read_sockets:
        if s == l:
            conn, addr = l.accept()
            print("New connection: ", str(addr))
            slist.append(conn)
        else:
            data = s.recv(1024)
            if len(data) == 0:
                print("Client close connection: %s" % (str(s.getpeername())))
                s.close()
                slist.remove(s)
            else:
                print("Get data (%d) from: %s" % (len(data), str(s.getpeername())))
                s.sendall(bytes("reply: " + str(data), "utf-8"))
