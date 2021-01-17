import sequtils, tables, sugar
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)
proc nextFloat(): float = scanf("%lf",addr result)
proc nextString(): string =
  var get = false
  result = ""
  while true:
    var c = getchar()
    if int(c) > int(' '):
      get = true
      result.add(c)
    else:
      if get: break
      get = false

let MOD = 998244353


proc modpow(aa, nn, m: int): int =
    var a = aa
    var n = nn
    result = 1
    while n > 0:
      if (n and 1) == 1:
        result = (result * a) mod m
      a = (a * a) mod m
      n = n shr 1

proc modinv(aa, m: int): int = 
  var 
    a = aa
    b = m
    u = 1
    v = 0
  while b > 0:
      var t = a div b;
      a -= t * b
      swap(a, b)
      u -= t * v
      swap(u, v)

  u = u mod m
  if (u < 0): u += m
  return u


proc solve(H:int, W:int, K:int, h:seq[int], w:seq[int], c:seq[string]):void =
  var ch = newSeqWith(H, newSeqWith(W, ' '))
  for k in 0..<K: 
    ch[h[k]-1][w[k]-1] = c[k][0]

  var dp = newSeqWith(H+1, newSeqWith(W+1, 0))

  dp[0][0] = modpow(3, H*W-K, MOD)
  # dump(dp[0][0])

  proc add_pat(i, j, p: int) =
    dp[i][j] = (dp[i][j] + p) mod MOD

  var inv3 = modinv(3, MOD)

  for i in 0..<H:
    for j in 0..<W:
      var cur = dp[i][j]

      case ch[i][j]
      of 'D':
        add_pat(i+1, j, cur)
      of 'R':
        add_pat(i, j+1, cur)
      of 'X':
        add_pat(i+1, j, cur)
        add_pat(i, j+1, cur)
      else:
        var newcur = (((cur + cur) mod MOD) * inv3) mod MOD
        add_pat(i+1, j, newcur)
        add_pat(i, j+1, newcur)

  var res = dp[H-1][W-1]
  echo res




proc main():void =
  var H = 0
  H = nextInt()
  var W = 0
  W = nextInt()
  var K = 0
  K = nextInt()
  var h = newSeqWith(K, 0)
  var w = newSeqWith(K, 0)
  var c = newSeqWith(K, "")
  for i in 0..<K:
      h[i] = nextInt()
      w[i] = nextInt()
      c[i] = nextString()
  solve(H, W, K, h, w, c);
  return

main()
