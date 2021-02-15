#please pip install pya3rt

import pya3rt
import jtalk

MESSAGE_REPLY_DEFAULT = ' '

def send_message(message):
    apikey = "####your api key####"
    client = pya3rt.TalkClient(apikey)
    reply_message = client.talk(message)
    print(reply_message['message'])
    if reply_message['message'] == 'empty reply':
       return MESSAGE_REPLY_DEFAULT
    return reply_message['results'][0]['reply']

if __name__ == "__main__":
    while True:
        message = input("message : ")
        reply   = send_message(message)
        print(reply)
        if reply != ' ':
           jtalk.jtalk(reply)