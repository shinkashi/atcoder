import sequtils, math, sugar
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

let MOD = 1000000007

proc solve(N: int, P: int): void =
  var total = (P-1)^N
  var sub = (N*(N div P))*(P-1)^(N-1)

  dump (total, sub, total-sub)


proc main(): void =
  var N = 0
  N = nextInt()
  var P = 0
  P = nextInt()
  solve(N, P);
  return

main()
