import math

# 素数判定関数
def isPrime(num):
    # 2未満の数字は素数ではない
    if num < 2: return False
    # 2は素数
    elif num == 2: return True
    # 偶数は素数ではない
    elif num % 2 == 0: return False

    # 3 ~ numまでループし、途中で割り切れる数があるか検索
    # 途中で割り切れる場合は素数ではない
    for i in range(3, math.floor(math.sqrt(num))+1, 2):
        if num % i == 0:
            return False

    # 素数
    return True

# 素数判定
def callIsPrime(input_num=1000):
    numbers = []
    # ループしながら素数を検索する
    for i in range(1, input_num):
        if isPrime(i):
            numbers.append(i)

    # 素数配列を返す
    return numbers

# 公開鍵と秘密鍵の生成

def createkey():
    p = int(input("一つ目のなるべく小さい素数pを入力して下さい。:"))
    q = int(input("一つ目と異なるなるべく小さい素数qを入力して下さい。:"))
    n = p * q
    num1 = p - 1
    num2 = q - 1
    phi = num1 * num2
    print("phi=" + str(phi))
    e = int(input("phiと素となる整数eを選んで下さい。:"))
    print("公開鍵 n e = " + str(n) + " " + str(e))
    for d in range(1,10000):
        x = ''
        num3 = (d * e)
        while num3 > phi:
           num3 = num3 % phi
           if num3 == 1:
              x = d
              print("秘密鍵 d = " + str(d))
        if len(str(x)) != 0:
           break

# 署名

def sign():
    m = int(input("署名する四桁の数字を入力して下さい:"))
    d = int(input("秘密鍵dを入力して下さい:"))
    n = int(input("公開鍵nを入力して下さい:"))
    s = (m ** d) % n
    print("署名s = " + str(s))

# 検証

def verify():
    e = int(input("公開鍵eを入力して下さい:"))
    n = int(input("公開鍵nを入力して下さい:"))
    s = int(input("署名sを入力して下さい:"))
    m = (s ** e) % n
    print('平文m = ' + str(m))

# 関数の呼び出し
print('1000迄の素数を表示します。')
print(callIsPrime(1000))
createkey()
sign()
verify()