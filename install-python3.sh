#!/bin/bash
sudo apt-get install -y build-essential 
sudo apt-get install -y checkinstall  
sudo apt-get install -y libreadline-gplv2-dev  
sudo apt-get install -y libncursesw5-dev 
sudo apt-get install -y libssl-dev 
sudo apt-get install -y libsqlite3-dev 
sudo apt-get install -y tk-dev 
sudo apt-get install -y libgdbm-dev 
sudo apt-get install -y libc6-dev 
sudo apt-get install -y libbz2-dev 
sudo apt-get install -y zlib1g-dev 
sudo apt-get install -y openssl  
sudo apt-get install -y libffi-dev 
sudo apt-get install -y python3-dev 
sudo apt-get install -y python3-setuptools 
sudo apt-get install -y wget

echo "dependency have installed!"

wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tar.xz

tar xvf Python-3.7.2.tar.xz

cd Python-3.7.2

./configure --enable-optimizations

sudo make altinstall

python3.7 --version

echo "Congratulations, Python3.7.2 have installed !"
