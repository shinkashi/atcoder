import sequtils
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

proc solve(H:int, W:int, K:int, h:seq[int], w:seq[int], c:seq[string]):void =
  discard

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
