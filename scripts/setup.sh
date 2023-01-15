#!/bin/bash
set -x
(cd ../ && git submodule update) 

pwd

sudo apt install lynx
sudo apt install iputils-arping
chmod +x scripts/*.sh

