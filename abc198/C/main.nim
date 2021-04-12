import sequtils, math, algorithm
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

proc solve(R: int, X: int, Y: int): void =



  proc reachable(n: int): bool =
    (X*X + Y*Y) <= (R * R * n * n)

  var lo = 0
  var hi = 150000

  while lo < hi:
    var mid = lo + ((hi-lo) div 2)
    if reachable(mid):
      hi = mid
    else:
      lo = mid + 1

  echo hi

proc main(): void =
  var R = 0
  R = nextInt()
  var X = 0
  X = nextInt()
  var Y = 0
  Y = nextInt()
  solve(R, X, Y);
  return

main()
