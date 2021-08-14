def xgcd(a, b):
    x0, y0, x1, y1 = 1, 0, 0, 1
    while b != 0:
        q, a, b = a // b, b, a % b
        x0, x1 = x1, x0 - q * x1
        y0, y1 = y1, y0 - q * y1
    return a, x0, y0

def modinv(a, m):
    g, x, y = xgcd(a, m)
    if g != 1:
        raise Exception('modular inverse does not exist')
    else:
        return x % m

def gen_K_inv(K):
    a, b = K[0]
    c, d = K[1]
    D = modinv(a*d - b*c, 26)
    print(a*d - b*c) # => 11
    print(D)         # => 19
    aa = ( d * D) % 26
    bb = (-b * D) % 26
    cc = (-c * D) % 26
    dd = ( a * D) % 26
    return [[aa, bb], [cc, dd]]

def mul(K, X):
    C = [0] * 2
    C[0] = (X[0] * K[0][0] + X[1] * K[1][0]) % 26
    C[1] = (X[0] * K[0][1] + X[1] * K[1][1]) % 26
    return C


K = [[5, 3], [3, 4]] # 暗号化鍵
K_inv = gen_K_inv(K) # 復号鍵
print(K_inv) # => [[24, 21], [21, 17]]

P = [14, 10] # 平文
C = mul(K, P) # 暗号化
print(C) # => [22, 4]

P2 = mul(K_inv, C) # 復号
print(P2) # => [14, 10]

# https://tex2e.github.io/blog/crypto/hill-cipher