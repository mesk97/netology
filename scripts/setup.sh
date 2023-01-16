#!/bin/bash
set -x
(cd ../ && git submodule update) 


sudo apt install lynx
sudo apt install iputils-arping
chmod +x scripts/*.sh

cd scripts \
	&& ln -sf arch_tools.sh zcat \
	&& ln -sf arch_tools.sh zgrep \
	&& ln -sf arch_tools.sh zmore

