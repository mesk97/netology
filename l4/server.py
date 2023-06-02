#!/usr/bin/env python

import socket
import time
import sys
import requests

HOST = str(sys.argv[1])
PORT = int(sys.argv[2])

socket_for_listen = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# соединить сокет с адресс/порт
socket_for_listen.bind((HOST, PORT))

# физически начинаем слушать на порту ждем новые соединения 
socket_for_listen.listen()

# принимаем новое соединение 
client_socket, addr = socket_for_listen.accept()
print("New client ", str(addr))

# принимаем данные 
data = client_socket.recv(1024)

# отправляем данные
client_socket.sendall(bytes("reply: " + str(data), "utf-8"))

client_socket.close()
socket_for_listen.close()

