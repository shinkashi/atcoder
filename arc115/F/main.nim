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


proc solve(N:int, h:seq[int], u:seq[int], v:seq[int], K:int, s:seq[int], t:seq[int]):void =
  discard

proc main():void =
  var N = 0
  N = nextInt()
  var h = newSeqWith(N, 0)
  for i in 0..<N:
    h[i] = nextInt()
  var u = newSeqWith(N-1, 0)
  var v = newSeqWith(N-1, 0)
  for i in 0..<N-1:
    u[i] = nextInt()
    v[i] = nextInt()
  var K = 0
  K = nextInt()
  var s = newSeqWith(K, 0)
  var t = newSeqWith(K, 0)
  for i in 0..<K:
    s[i] = nextInt()
    t[i] = nextInt()
  solve(N, h, u, v, K, s, t);
  return

main()
