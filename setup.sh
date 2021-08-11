#!/bin/bash
MY_PATH=`pwd`
tar zxvf $MY_PATH/python3/Python-3.8.9.tgz -C $MY_PATH/python3/
cd $MY_PATH/python3/Python-3.8.9
./configure prefix=/usr/local/python3
make && make install
ln -s /usr/local/python3/bin/python3.8 /usr/bin/python3.8
ln -s /usr/local/python3/bin/pip3.8 /usr/bin/pip3.8
pip3.8 install --user rasa
