#coding: utf-8
import subprocess
from datetime import datetime
import winsound
import sys

q = sys.argv [1]

def jtalk(t):
    # depend on your install folder
    OPENJTALK_BINPATH = '../EXE/open_jtalk-1.11/bin'
    OPENJTALK_DICPATH = '../EXE/open_jtalk-1.11/mecab-naist-jdic'
    # VOICEPATH -> can change mei voice
    OPENJTALK_VOICEPATH = 'mei/mei_normal.htsvoice'
    open_jtalk=[OPENJTALK_BINPATH + '/open_jtalk.exe']
    mech=['-x',OPENJTALK_DICPATH]
    htsvoice=['-m',OPENJTALK_VOICEPATH]
    speed=['-r','1.0']
    outwav=['-ow','open_jtalk.wav']
    cmd=open_jtalk+mech+htsvoice+speed+outwav
    c = subprocess.Popen(cmd,stdin=subprocess.PIPE)
    if t is None:
    # convert text encoding from utf-8 to shitf-jis
      c.stdin.write(t.encode('shift-jis'))
    else:
      c.stdin.write(q.encode('shift-jis'))
    c.stdin.close()
    c.wait()

    # play wav audio file with winsound module
    winsound.PlaySound('open_jtalk.wav', winsound.SND_FILENAME)


def say_datetime():
    # get datetime and call jtalk
    d = datetime.now()
    text = '%s月%s日、%s時%s分%s秒' % (d.month, d.day, d.hour, d.minute, d.second)
    jtalk(text)

if __name__ == '__main__':
    say_datetime()