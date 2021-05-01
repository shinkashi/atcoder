import sequtils, math
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
  var N = nextInt()
  var M = nextInt()
  var X, Y, Z: seq[int]
  for i in 0..M-1:
    X.add(nextInt())
    Y.add(nextInt())
    Z.add(nextInt())

  var dp = newSeqWith(2^18, 0)

  for i in 0..<N:





main()
