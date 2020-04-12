#pip install pycryptodome
#
from Crypto.Cipher import AES
import sys

if(len(sys.argv) <= 1):
  print("AES.py [/e] 暗号化モード\nAES.py [/d] 復号化モード")
  sys.exit()

# Encryption

def encryption_AES():

 if sys.argv[1] == "/e":
  key = str(input("鍵を16byteで入力してください。:"))
  key = key.encode('utf-8')
  print("key=" + str(key))
  text = str(input("AESのCBCモードで暗号化する文字列を入力してください。:"))
  byteLimit = len(text.encode())
  print('bytecount=' + str(byteLimit))

  if byteLimit < 16:
    a = 16 - byteLimit
    if a == 1:
      padding = '#'
    elif a == 2:
      padding = '##'
    elif a == 3:
      padding = '###'
    elif a == 4:
      padding = '####'
    elif a == 5:
      padding = '#####'
    elif a == 6:
      padding = '######'
    elif a == 7:
      padding = '#######'
    elif a == 8:
      padding = '########'
    elif a == 9:
      padding = '#########'
    elif a == 10:
      padding = '##########'
    elif a == 11:
      padding = '###########'
    elif a == 12:
      padding = '############'
    elif a == 13:
      padding = '#############'
    elif a == 14:
      padding = '##############'
    elif a == 15:
      padding = '###############'
  if byteLimit % 16 == 0:
    padding = ''
  elif byteLimit % 16 == 1:
    padding = '###############'
  elif byteLimit % 16 == 2:
    padding = '##############'
  elif byteLimit % 16 == 3:
    padding = '#############'
  elif byteLimit % 16 == 4:
    padding = '############'
  elif byteLimit % 16 == 5:
    padding = '###########'
  elif byteLimit % 16 == 6:
    padding = '##########'
  elif byteLimit % 16 == 7:
    padding = '#########'
  elif byteLimit % 16 == 8:
    padding = '########'
  elif byteLimit % 16 == 9:
    padding = '#######'
  elif byteLimit % 16 == 10:
    padding = '######'
  elif byteLimit % 16 == 11:
    padding = '#####'
  elif byteLimit % 16 == 12:
    padding = '####'
  elif byteLimit % 16 == 13:
    padding = '###'
  elif byteLimit % 16 == 14:
    padding = '##'
  elif byteLimit % 16 == 15:
    padding = '#'

  print('padding='+ padding)
  text = (text + padding)
  text = text.encode('utf-8')
  #print(text)

  encryption_suite = AES.new(key, AES.MODE_CBC, b'this_is_change_space')
  cipher_text = encryption_suite.encrypt(text)
  print("cipher_text=" + str(cipher_text))
  sys.exit()

# Decryption

def decryption_AES():

 if sys.argv[1] == "/d":

  key = (input("鍵を16byteで入力してください。:"))
  key = key.encode('utf-8')
  print("key=" + str(key))

  cipher_text = bytes(input("復号する文字列を入力してください。:"),'utf-8')
  cipher_text = eval(cipher_text)
  #print(cipher_text)

  decryption_suite = AES.new(key, AES.MODE_CBC, b'OnTheKumoProject')
  plain_text = decryption_suite.decrypt(cipher_text)
  plain_text = plain_text.decode('utf-8')
  print("plain_text=" + plain_text)

if __name__ == '__main__':
  encryption_AES()
  decryption_AES()