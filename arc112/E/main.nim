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

proc solve(n:int, m:int, a:seq[int]):void =
  discard

proc main():void =
  var n = 0
  n = nextInt()
  var m = 0
  m = nextInt()
  var a = newSeqWith(n, 0)
  for i in 0..<n:
    a[i] = nextInt()
  solve(n, m, a);
  return

main()
