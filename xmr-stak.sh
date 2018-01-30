#!/bin/bash 
add-apt-repository ppa:ubuntu-toolchain-r/test 
apt-get update 
apt-get install gcc-5 g++-5 
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5 
apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev 
git clone "https://github.com/fireice-uk/xmr-stak.git" 
mkdir xmr-stak/build 
cd xmr-stak/build 
cmake -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF .. 
make install 
sysctl -w vm.nr_hugepages=128 
cd 
nano xmr-stak/xmrstak/donate-level.hpp 
cd xmr-stak/build/bin 
screen 
./xmr-stak 
