import sequtils, sugar
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld", addr result)
proc nextFloat(): float = scanf("%lf", addr result)
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



proc main(): void =
  var H = nextInt()
  var W = nextInt()
  var A = newSeqWith(H, newSeqWith(W, 0))
  discard getchar()

  for h in 0..<H:
    for w in 0..<W:
      # var tk = (if (h + w) mod 2 == 1: 1 else: -1)
      case getchar()
      of '+': A[h][w] = 1
      of '-': A[h][w] = -1
      else:
        raiseAssert("unknown char")
    discard getchar()

  var dp = newSeqWith(H, newSeqWith(W, 0))

  for n in 1..(H+W):
    var y = n
    var x = 0
    while y >= 0:
      if y in 0..H-1 and x in 0..W-1:
        if n mod 2 == 1:
          # Takahashi
          var m = int.low
          if x > 0: m = max(m, dp[y][x-1])
          if y > 0: m = max(m, dp[y-1][x])
          dp[y][x] = m + A[y][x]
        else:
          # Aoki
          var m = int.high
          if x > 0: m = min(m, dp[y][x-1] - A[y][x])
          if y > 0: m = min(m, dp[y-1][x] - A[y][x])
          dp[y][x] = m

      inc x
      dec y

  dump dp

  if dp[H-1][W-1] == 0:
    echo "Draw"
    return

  if ((H + W) mod 2 == 1) xor (dp[H-1][W-1] > 0):
    echo "Aoki"
  else:
    echo "Takahashi"

main()
