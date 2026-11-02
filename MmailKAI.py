import imaplib
import email
from email.header import decode_header

IMAP_HOST = "imaps.eonet.ne.jp"
IMAP_PORT = 993
USER = "あなたのメールアドレス"
PASS = "パスワード"

# ---------------------------------------------------------
# 安全デコード関数（unknown-8bit / 壊れたエンコード対応）
# ---------------------------------------------------------
def safe_decode(value):
    try:
        parts = decode_header(value)
    except Exception:
        return value

    decoded_fragments = []

    for decoded, enc in parts:
        if isinstance(decoded, bytes):
            # 試す文字コードの優先順位
            for charset in [enc, "utf-8", "iso-2022-jp", "shift_jis", "euc-jp"]:
                if charset is None:
                    continue
                try:
                    decoded = decoded.decode(charset, errors="ignore")
                    break
                except Exception:
                    continue
        decoded_fragments.append(decoded)

    return "".join(decoded_fragments)


# ---------------------------------------------------------
# IMAP 接続
# ---------------------------------------------------------
imap = imaplib.IMAP4_SSL(IMAP_HOST, IMAP_PORT)
imap.login(USER, PASS)

# ---------------------------------------------------------
# フォルダ一覧を表示（迷惑メールフォルダ名確認用）
# ---------------------------------------------------------
status, folders = imap.list()
print("=== IMAP フォルダ一覧 ===")
for f in folders:
    print(f.decode())

# 必要に応じて変更
SPAM_FOLDER = "Junk"

# ---------------------------------------------------------
# 迷惑メールフォルダ選択
# ---------------------------------------------------------
status, _ = imap.select(SPAM_FOLDER)
if status != "OK":
    print(f"フォルダ {SPAM_FOLDER} を開けませんでした")
    imap.logout()
    exit()

# ---------------------------------------------------------
# メール検索
# ---------------------------------------------------------
status, data = imap.search(None, "ALL")
ids = data[0].split()

print(f"迷惑メール件数: {len(ids)}")

# ---------------------------------------------------------
# 各メールのヘッダー抽出
# ---------------------------------------------------------
for msg_id in ids:
    status, msg_data = imap.fetch(msg_id, "(RFC822)")
    if status != "OK":
        print(f"{msg_id} の取得に失敗")
        continue

    raw = msg_data[0][1]
    msg = email.message_from_bytes(raw)

    headers = []
    for key, value in msg.items():
        decoded = safe_decode(value)
        headers.append(f"{key}: {decoded}")

    header_text = "\n".join(headers)

    # 保存
    filename = f"header_{msg_id.decode()}.txt"
    with open(filename, "w", encoding="utf-8") as f:
        f.write(header_text)

    print(f"{filename} に保存しました")

# ---------------------------------------------------------
# 終了処理
# ---------------------------------------------------------
imap.close()
imap.logout()
