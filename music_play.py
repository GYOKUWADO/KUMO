import vlc
import webbrowser
import requests
import json

# 音楽ファイルのURL
base_url = "https://kumo.site/sp/hiphop"

# Fetch data from the URL
response = requests.get(base_url + "/hiphop.json")

def play_sound():
# Check if the request was successful
 if response.status_code == 200:
    # Parse JSON data
    data = response.json()
    #print(data)
    for d in data:
        res_a = d['id']
        res_b = d['music']
        res_d = d['singer']
        res_e = d['beats']
        res_f = d['youtube']
        print(res_a + " " + res_b[:-4:])

    id = str(input("歌のIDを入力してください。:"))
    for d in data:
        res_a = d['id']
        res_b = d['music']
        res_c = d['lyrics']
        if id == res_a:
           #print(base_url + "/" + res_b)
           player = vlc.MediaPlayer(base_url + "/" + res_b)

           y = input('歌詞ファイルにアクセスしますか？(y/n) : ')

           if y == 'y' :

              webbrowser.open(base_url + "/" + res_c)

           # 再生
           player.play()

           # 再生を続けるために待機
           input("Press Enter to stop playback...")
           player.stop()

 else:
    print(f"Failed to fetch data. Status code: {response.status_code}")

if __name__ == "__main__":
    play_sound()