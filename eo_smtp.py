import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
from pathlib import Path

def send_eomail_with_attachment(sender_email, password, to_list,
                                subject, body, file_path):

    # 添付ファイル確認
    file_path = Path(file_path)
    if not file_path.exists():
        raise FileNotFoundError(f"添付ファイルが見つかりません: {file_path}")

    # メール全体（multipart）
    msg = MIMEMultipart()
    msg["From"] = sender_email
    msg["To"] = ", ".join(to_list)
    msg["Subject"] = subject

    # 本文
    msg.attach(MIMEText(body, "plain", "utf-8"))

    # 添付ファイル
    with open(file_path, "rb") as f:
        part = MIMEBase("application", "octet-stream")
        part.set_payload(f.read())

    encoders.encode_base64(part)
    part.add_header(
        "Content-Disposition",
        f'attachment; filename="{file_path.name}"'
    )
    msg.attach(part)

    # eo光メール SMTP（SSL 465）
    SMTP_HOST = "smtps.eonet.ne.jp"
    SMTP_PORT = 465

    # 送信
    with smtplib.SMTP_SSL(SMTP_HOST, SMTP_PORT) as server:
        server.login(sender_email, password)
        all_recipients = to_list
        server.sendmail(sender_email, all_recipients, msg.as_string())

    print("✅ eo光メールで添付ファイル送信完了")



# 使用例
if __name__ == "__main__":
    send_eomail_with_attachment(
        sender_email="あなたのメールアドレス",
        password="aパスワード",
        to_list=["meiwaku@dekyo.or.jp"],
        subject="フィッシングメール届いています。宜しくお願いします。",
        body="eo光メールから Python で送信しています。",
        file_path="MEIWAKU_Mail_Header.zip"
    )
