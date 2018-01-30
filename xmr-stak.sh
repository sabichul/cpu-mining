#!/bin/bash 
add-apt-repository ppa:ubuntu-toolchain-r/test 
apt-get update 
apt-get install gcc-5 g++-5 
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5 
apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev 
wget https://github.com/fireice-uk/xmr-stak/archive/master.zip
unzip master.zip
mkdir xmr-stak-master/build 
cd xmr-stak-master/build 
cmake -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF .. 
make install 
sysctl -w vm.nr_hugepages=128 
cd 
nano xmr-stak-master/xmrstak/donate-level.hpp 
cd xmr-stak-master/build/bin 
screen 
./xmr-stak 
