# @author: http://www.github.com/muhualing
# @time: 2019-08-11T03:06:47.101Z
# Overview: This is a shell script to install python3.6 on Centos 7.4 64bit with ARM by compiling the source code from Python.org
# How to run: 

# Get source code of python3.6 from python.org and unzip it
wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tar.xz
# If your net speed is slow. You can upload Python-3.6.9.tar.xz to your computer and do following bash commands.
tar -xvf Python-3.6.9.tar.xz

# Compile python3.6
cd Python-3.6.9

# Configure the build. 
# And move the installation path from default "/usr/local" to custom path "/usr/local/python3.6"
./configure --prefix=/usr/local/python3.6

# Solve Issue zipimport.ZipImportError: can't decompress data; zlib not available
# Install reference "zlib*"
# In file "./Modules/Setup"
# Eliminate "#" in the front of "#zlib zlibmodule.c -I$(prefix)/include -L$(exec_prefix)/lib -lz"
yum -y install zlib*
sed -i "s/#zlib/zlib/g" ./Modules/Setup

make && make install
# Create soft link
# if you want to delete, use "rm" command
ln -s /usr/local/python3.6/bin/python3 /usr/bin/python3
ln -s /usr/local/python3.6/bin/pip3 /usr/bin/pip3