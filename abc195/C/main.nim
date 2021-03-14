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


proc solve(N: int): void =
  var
    n = N
    x = 1000
    c = 0
    total = 0

  while true:
    var t = min(x-1, n)
    total += (t - (x div 1000) + 1) * c
    if n < x:
      break

    c += 1
    x *= 1000

  echo total

proc main(): void =
  var N = 0
  N = nextInt()
  solve(N);
  return

main()
