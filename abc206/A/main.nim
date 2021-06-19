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


proc solve(N: float): void =
  var price: int = floor(1.08 * N).toInt
  if price < 206: echo "Yay!"
  elif price == 206: echo "so-so"
  else: echo ":("


proc main(): void =
  var N = nextFloat()
  solve(N)
  return

main()
