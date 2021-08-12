# rasa-all-in-love
基于rasa的情话小王子，所有训练数据均是情话，请勿上传不是情话的训练模型！


安装步骤：

1.在当前目录下执行sudo ./setup.sh 

(******注意*****)

rasa仅能在Python3.8的环境下运行，目前还未支持3.9

Ubuntu:
执行setup.sh 会在/usr/local/python3下安装python3.8.9,并软连接到/usr/bin/python3.8 和 /usr/bin/pip3.8
该脚本还会自动执行pip3 install rasa 

MacOS：
执行setup.sh会安装pyenv,然后通过pyenv 安装python3.8.9 ,并软连接到/usr/local/bin/python3.8 和 /usr/local/bin/pip3.8

2.如果已有Python3.8的环境，请勿执行setup.sh,根据setup.sh里面的内容执行pip install 


使用步骤：
1.在代码根目录执行 python3.8 -m rasa train 即可训练当前目录下模型
2.在代码根目录执行 python3.8 -m rasa_chinese_service.nlu.tokenizers.lm_tokenizer bert-base-chinese 启动中文分词器服务
3.在代码根目录执行 python3.8 rasa shell打开命令行进行对话或者通过python3.8 rasa x 打开浏览器对话窗口

更新数据库：
常用的数据训练库是data/nlu.yml,domain.yml,data/rules.yml,data/stories.yml
1. data/nlu.yml

data/nlu.yml是用来判断用户输出的意图
如下

version: "2.0"

nlu:
- intent: greet
  examples: |
    - hey
    - hello
    - hi
    - hello there
    - good morning
    - good evening
    - moin
    - hey there
    - let's go
    - hey dude
    - goodmorning
    - goodevening
    - good afternoon
    
表示如果用户输出 hello、good morning等话语的时候，intent意图是greet打招呼

2.domain.yml 

domain.yml是根据用户的意图 回复的话语 
version: "2.0"

intents:
  - greet
  - goodbye
  - affirm
  - deny
  - mood_great
  - mood_unhappy
  - bot_challenge

responses:
  utter_greet:
  - text: "Hey! How are you?"

  utter_cheer_up:
  - text: "Here is something to cheer you up:"
    image: "https://i.imgur.com/nGF1K8f.jpg"

  utter_did_that_help:
  - text: "Did that help you?"

  utter_happy:
  - text: "Great, carry on!"

  utter_goodbye:
  - text: "Bye"

  utter_iamabot:
  - text: "I am a bot, powered by Rasa."

intent表示注册的Intent,response则表示对对应intent的回应，前面建议加上utter_

3. data/rules.yml

data/rules.yml 是将responses与intent 绑定的规则

rules:

- rule: Say goodbye anytime the user says goodbye
  steps:
  - intent: goodbye
  - action: utter_goodbye

- rule: Say 'I am a bot' anytime the user challenges
  steps:
  - intent: bot_challenge
  - action: utter_iamabot

4. data/stories.yml

data/stories.yml 是记录一种抽象的对话场景，以方便机器人辨析更长的对话链条

version: "2.0"

stories:

- story: happy path
  steps:
  - intent: greet
  - action: utter_greet
  - intent: mood_great
  - action: utter_happy

- story: sad path 1
  steps:
  - intent: greet
  - action: utter_greet
  - intent: mood_unhappy
  - action: utter_cheer_up
  - action: utter_did_that_help
  - intent: affirm
  - action: utter_happy

- story: sad path 2
  steps:
  - intent: greet
  - action: utter_greet
  - intent: mood_unhappy
  - action: utter_cheer_up
  - action: utter_did_that_help
  - intent: deny
  - action: utter_goodbye

可以看到上面这些就是一个场景抽象出来的Intent和action 


5.修改完上述训练数据后，就可以使用rasa train 重新训练，用rasa shell继续测试你的模型


