# rasa-all-in-love
基于rasa的情话小王子，所有训练数据均是情话，请勿上传不是情话的训练模型！i
安装步骤：
1.在当前目录下执行sudo ./setup.sh 
(***注意*****)
rasa仅能在Python3.8的环境下运行，目前还未支持3.9
执行setup.sh 会在/usr/local/python3下安装python3.8,并软连接到/usr/bin/python3.8 和 /usr/bin/pip3.8
该脚本还会自动执行pip3 install rasa 
2.如果已有Python3.8的环境，请勿执行setup.sh,直接执行 pip3 install rasa即可
