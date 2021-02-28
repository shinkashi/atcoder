import sequtils, math, sugar, sets
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
  var c = N
  var amax = (sqrt(N.toFloat)+1).toInt
  var found = initHashSet[int]();

  for a in 2..amax:
    for b in 2..N:
      var v = a ^ b
      # dump (a, b, v, c)
      if v <= N:
        if not found.contains(v):
          dec c
          found.incl(v)
      else:
        break

  echo c


proc main(): void =
  var N = 0
  N = nextInt()
  solve(N);
  return

main()
