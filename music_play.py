import vlc
import webbrowser
import requests
import json
import sys

#zip file code
import os
import shutil
import urllib.error
import urllib.request
import zipfile

#sha256
import hashlib

import pygame
import time

# 音楽ファイルのURL
base_url = "https://kumo.site/sp/hiphop"

# zip fileのダウンロードディレクトリ
data_dir_path = "./HIPHOP_MUSIC/"
file_url = "https://kumo.site/zip/HIPHOP_MUSIC.zip"
save_path = "./HIPHOP_MUSIC/download.zip"

def calculate_sha256(file_path):
    sha256_hash = hashlib.sha256()
    try:
        with open(file_path, "rb") as f:
            # ファイルをチャンクごとに読み込む（大きなファイルに対応）
            for byte_block in iter(lambda: f.read(4096), b""):
                sha256_hash.update(byte_block)
        return sha256_hash.hexdigest()
    except FileNotFoundError:
        return "ファイルが見つかりません。パスを確認してください。"
    except Exception as e:
        return f"エラーが発生しました: {e}"

# Fetch data from the URL
response = requests.get(base_url + "/hiphop.json")

def play_sound():
# Check if the request was successful
 if response.status_code == 200:
    # Parse JSON data
    data = response.json()
    #print(data)
    #print("0 ***zipfileでまとめてダウンロード***")
    for d in data:
        res_a = d['id']
        res_b = d['music']
        res_d = d['singer']
        res_e = d['beats']
        res_f = d['youtube']
        print(res_a + " " + res_b[:-4:])

    id = str(input("IDを入力してください。:"))

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

def zip_DL():
    #if id == "0":
          print("OK")

          # 保存先ディレクトリ作成
          if os.path.exists(data_dir_path):
              # 既にある場合は、先に丸ごと削除する
              shutil.rmtree(data_dir_path)
          print(data_dir_path + "を作成しました。")
 
          os.mkdir(data_dir_path)

          try:
            with urllib.request.urlopen(file_url) as download_file:
                data = download_file.read()
                with open(save_path, mode='wb') as save_file:
                    save_file.write(data)
                    print(data_dir_path + "にzipファイルをダウンロードしました。")

                    hash_value = calculate_sha256(save_path)
                    print(f"SHA-256: {hash_value}")

                # shutilを使用して解凍
                #shutil.unpack_archive(save_path, data_dir_path, 'zip')
                #print("HIPHOP_MUSICをダウンロードして解凍しました。")

                # ディレクトリ内のファイル名を取得してエンコード
                #for filename in os.listdir(data_dir_path):
                #  encoded_filename = filename.encode('utf-8')  # UTF-8にエンコード
                #  print(f"Original: {filename}, Encoded: {encoded_filename}")

                x = input('zipファイルを解凍しますか？(y/n) : ')

                if x == 'y' :

                 with zipfile.ZipFile(data_dir_path + "download.zip") as obj_zip:
                    # 指定ディレクトリにすべてを保存する
                    #obj_zip.extractall(data_dir_path)

                    # エンコーディングを指定してファイルを解凍
                    for file_info in obj_zip.infolist():

                        # ファイル名をShift_JISからUTF-8に変換
                        file_name = file_info.filename.encode('cp437').decode('shift_jis')
                        with open(os.path.join(data_dir_path,file_name), 'wb') as f:
                             f.write(obj_zip.read(file_info.filename))

                    print("HIPHOP_MUSICを解凍しました。")

          except urllib.error.URLError as e:
            print(e)

def play_hiphop_music_all():

   play_music_all = []

   # JSONファイルを開く
   with open(data_dir_path + 'hiphop.json', 'r', encoding='utf-8') as file:
       # JSONファイルをPythonオブジェクトに変換
       data = json.load(file)

   for index, item in enumerate(data):
       play_music_all.append(item["music"])

   #print(play_music_all)

   # pygameの初期化
   pygame.mixer.init()

   # 音楽を順番に再生
   for music in play_music_all:
       print(f"再生中: {music}")
       pygame.mixer.music.load(data_dir_path + music)  # 音楽ファイルをロード
       pygame.mixer.music.play()      # 再生開始

       # 再生が終了するまで待機
       while pygame.mixer.music.get_busy():
           time.sleep(1)

   print("すべての曲が再生されました！")


if __name__ == "__main__":
 if len(sys.argv) <= 1:
  print("-p     play sound online from [kumo.site]")
  print("-z     zipfileでまとめてダウンロード。")
  print("-l     ローカルで全て再生。")
 elif sys.argv[1] == "-p":
   play_sound()
 elif sys.argv[1] == "-z":
   zip_DL()
 elif sys.argv[1] == "-l":
   play_hiphop_music_all()