#!/usr/bin/env bash

if [[ -e /usr/local/bin/lmctfy ]]; then
  exit
fi

set -o errexit
set -o verbose

#
sudo yum update -y
sudo rpm -Uvh http://mirror.centos.org/centos/6.5/centosplus/x86_64/Packages/kernel-devel-2.6.32-431.1.2.el6.centos.plus.x86_64.rpm
sudo yum groupinstall -y "Development Tools"

#
## Protocol Buffers (protobuf) Install
#
yum install -y protobuf protobuf-compiler protobuf-devel.x86_64

#
## gflags Install
#
curl -L -O https://gflags.googlecode.com/files/gflags-2.0-no-svn-files.tar.gz

tar zxvf gflags-2.0-no-svn-files.tar.gz

pushd gflags-2.0
  ./configure && make && make install
popd
rm -rf gflags-2.0/ gflags-2.0-no-svn-files.tar.gz

#
## RE2 (re2) Install
#
curl -L -O https://re2.googlecode.com/files/re2-20131024.tgz

tar zxvf re2-20131024.tgz
pushd re2
  make && make install
popd
rm -rf re2/ re2-20131024.tgz

echo /usr/local/lib >> /etc/ld.so.conf
ldconfig


#
## g++ version 4.7 Install
#
pushd /etc/yum.repos.d
  curl -L -O http://people.centos.org/tru/devtools-1.1/devtools-1.1.repo
popd

yum --enablerepo=testing-1.1-devtools-6 install -y devtoolset-1.1-gcc devtoolset-1.1-gcc-c++

export CC=/opt/centos/devtoolset-1.1/root/usr/bin/gcc
export CXX=/opt/centos/devtoolset-1.1/root/usr/bin/g++

#
# lmctfy Install
#
git clone https://github.com/google/lmctfy.git

pushd lmctfy
  make lmctfy
  sudo cp ./bin/lmctfy/cli/lmctfy /usr/local/bin/
popd
rm -rf lmctfy

#
# libcgroup Install
#
yum install -y libcgroup
service cgconfig start
chkconfig cgconfig on


echo "###########################################"
echo "Finished Vagrant up..."
echo "Let's Enjoy lmctfy"
echo "                     @wasabeef_jp"
echo "                     thank you"
echo "###########################################"


