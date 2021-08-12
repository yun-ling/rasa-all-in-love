#!/bin/bash
MY_PATH=`pwd`
sys_name=`uname`
macos="Darwin"
linux="Linux"
if [[ $sys_name = $macos  ]];then
	brew install pyenv
	pyenv install 3.8.9
	ln -s /usr/local/var/pyenv/versions/3.8.9/bin/python3.8 /usr/local/bin/python3.8
	ln -s /usr/local/var/pyenv/versions/3.8.9/bin/pip3.8 /usr/local/bin/pip3.8
elif [[ $sys_name = $linux ]];then
	tar zxvf $MY_PATH/python3/Python-3.8.9.tgz -C $MY_PATH/python3/
	cd $MY_PATH/python3/Python-3.8.9
	./configure prefix=/usr/local/python3
	make && make install
	ln -s /usr/local/python3/bin/python3.8 /usr/bin/python3.8
	ln -s /usr/local/python3/bin/pip3.8 /usr/bin/pip3.8
else
	echo "Error:Can't identify system type!"
fi
pip3.8 install wheel
pip3.8 install --user rasa
pip3.8 install --user rasa[transformers]
pip3.8 install --user rasa_chinese_service
pip3.8 install --user rasa_chinese
pip3.8 install rasa-x --extra-index-url https://pypi.rasa.com/simple
