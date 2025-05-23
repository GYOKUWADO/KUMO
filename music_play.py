import vlc
import webbrowser

# 音楽ファイルのURL
base_url = "https://kumo.site/sp/hiphop/"
m1 = "GO_WAY"
m2 = "PROJECT"
m3 = "ROUTE24"
m4 = "いつか"
m5 = "いつも前見て"
m6 = "一期一会"
m7 = "雨上がる"
m8 = "花が咲く"
m9 = "玉和道"
m10 = "幸せを願って"
m11 = "国々1.1"
m12 = "償い"
m13 = "日出る国"
m14 = "日々"
m15 = "明日晴れたら"
m16 = "涙"
m17 = "声"
m18 = "ONE_DAY"
m19 = "そのまま"
m20 = "MASTER"
m21 = "MIYAKO"

print("1:" + m1)
print("2:" + m2)
print("3:" + m3)
print("4:" + m4)
print("5:" + m5)
print("6:" + m6)
print("7:" + m7)
print("8:" + m8)
print("9:" + m9)
print("10:" + m10)
print("11:" + m11)
print("12:" + m12)
print("13:" + m13)
print("14:" + m14)
print("15:" + m15)
print("16:" + m16)
print("17:" + m17)
print("18:" + m18)
print("19:" + m19)
print("20:" + m20)
print("21:" + m21)

def play_sound():

        x = input('番号を選択して下さい : ')

        if x == '1' :
         x = m1
        elif x == '2' :
         x = m2
        elif x == '3' :
         x = m3
        elif x == '4' :
         x = m4
        elif x == '5' :
         x = m5
        elif x == '6' :
         x = m6
        elif x == '7' :
         x = m7
        elif x == '8' :
         x = m8
        elif x == '9' :
         x = m9
        elif x == '10' :
         x = m10
        elif x == '11' :
         x = m11
        elif x == '12' :
         x = m12
        elif x == '13' :
         x = m13
        elif x == '14' :
         x = m14
        elif x == '15' :
         x = m15
        elif x == '16' :
         x = m16
        elif x == '17' :
         x = m17
        elif x == '18' :
         x = m18
        elif x == '19' :
         x = m19
        elif x == '20' :
         x = m20
        elif x == '21' :
         x = m21

        # VLCプレイヤーを初期化
        player = vlc.MediaPlayer(base_url + x + ".mp3")
        webbrowser.open(base_url + x + ".txt")

        # 再生
        player.play()

        # 再生を続けるために待機
        input("Press Enter to stop playback...")
        player.stop()

if __name__ == "__main__":
    play_sound()