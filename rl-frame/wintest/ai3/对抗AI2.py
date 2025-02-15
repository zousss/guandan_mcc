# -*- coding: utf-8 -*-
# @Time       : 2020/10/1 16:30
# @Author     : Duofeng Wu
# @File       : client.py
# @Description:
# 对抗AI2号


import json

pos = 0
from ws4py.client.threadedclient import WebSocketClient
from state import State
from action import Action


class ExampleClient(WebSocketClient):

    def __init__(self, url):
        super().__init__(url)
        self.state = State()
        self.action = Action()

    def opened(self):
        pass

    def closed(self, code, reason=None):
        print("Closed down", code, reason)

    def received_message(self, message):
        message = json.loads(str(message))                                    # 先序列化收到的消息，转为Python中的字典
        self.state.parse(message)                                             # 调用状态对象来解析状态
        if 'myPos' in message:            
            global pos             
            pos = message['myPos']        
        if "actionList" in message:    # 需要做出动作选择时调用动作对象进行解析
            #由AI进行选择，座位号随时读取
            act_index = self.action.parse_AI(message,pos)
            self.send(json.dumps({"actIndex": act_index}))


if __name__ == '__main__':
    try:
        ws = ExampleClient('ws://112.124.24.226:80/game/gd/15116703191624017')
        # ws = ExampleClient('ws://127.0.0.1:9618/game/gd/client3')
        ws.connect()
        ws.run_forever()
    except KeyboardInterrupt:
        ws.close()


