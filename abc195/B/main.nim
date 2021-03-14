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

proc solve(A: float, B: float, W: float): void =
  var w = W * 1000
  var min = ceil(w / B).toInt
  var max = floor(w / A).toInt
  if min <= max:
    echo min, " ", max
  else:
    echo "UNSATISFIABLE"

proc main(): void =
  var A = 0.0
  A = nextFloat()
  var B = 0.0
  B = nextFloat()
  var W = 0.0
  W = nextFloat()
  solve(A, B, W);
  return

main()
