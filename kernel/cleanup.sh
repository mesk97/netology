#!/bin/bash

set -ex

sudo dkms uninstall -m my_module -v 0.01 || /bin/true

sudo rm -rf /usr/src/my_module-0.01

for i in ./my_module ./interrupts ./real_module; do
	( cd $i && make clean )
done

