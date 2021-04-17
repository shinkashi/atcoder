import sequtils
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


proc solve(X: int, Y: int, Z: int): void =
  var R = (Y * Z) div X
  var Rm = (Y * Z) mod X
  if Rm == 0:
    R -= 1
  echo R

proc main(): void =
  var X = 0
  X = nextInt()
  var Y = 0
  Y = nextInt()
  var Z = 0
  Z = nextInt()
  solve(X, Y, Z);
  return

main()
