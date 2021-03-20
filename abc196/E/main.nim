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


proc solve(N:int, a:seq[int], t:seq[int], Q:int, x:seq[int]):void =
  discard

proc main():void =
  var N = 0
  N = nextInt()
  var a = newSeqWith(N, 0)
  var t = newSeqWith(N, 0)
  for i in 0..<N:
    a[i] = nextInt()
    t[i] = nextInt()
  var Q = 0
  Q = nextInt()
  var x = newSeqWith(Q, 0)
  for i in 0..<Q:
    x[i] = nextInt()
  solve(N, a, t, Q, x);
  return

main()
