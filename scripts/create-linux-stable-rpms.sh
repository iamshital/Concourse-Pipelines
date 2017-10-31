#!/bin/bash

yum -y groupinstall "Development Tools"
yum -y install openssl-devel
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable
make oldconfig
make rpm