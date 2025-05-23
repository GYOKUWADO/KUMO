import requests
import zipfile
import os

# ダウンロードするZIPファイルのURL
url = "https://kumo.site/zip/HIPHOP_MUSIC.zip"

# 保存先のファイル名
save_path = "HIPHOP_MUSIC.zip"
extract_to = 'HIPHOP_MUSIC'

# ZIPファイルをダウンロード
response = requests.get(url, stream=True)

# ステータスコードを確認
if response.status_code == 200:
    with open(save_path, "wb") as file:
        for chunk in response.iter_content(chunk_size=1024):
            file.write(chunk)
    print(f"ZIPファイルが正常にダウンロードされました: {save_path}")
    
    # ZIPファイルを展開
    with zipfile.ZipFile(save_path) as z:
     for info in z.infolist():
        info.filename = info.orig_filename.encode('cp437').decode('cp932')
        if os.sep != "/" and os.sep in info.filename:
            info.filename = info.filename.replace(os.sep, "/")
        z.extract(info, extract_to)
    print(f"ZIPファイルを '{extract_to}' に展開しました。")
else:
    print(f"ダウンロードに失敗しました。ステータスコード: {response.status_code}")