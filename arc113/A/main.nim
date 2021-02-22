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


proc solve(K: int): void =
  var km = K # ceil(pow(K.toFloat, 1.0 / 3)).toInt
  var cnt = 0
  for a in 1..km:
    for b in 1..km:
      var maxC = K div a div b;
      # dump (a, b, maxC)
      if maxC == 0: break
      cnt += maxC

  echo cnt

proc main(): void =
  var K = 0
  K = nextInt()
  solve(K);
  return

main()
