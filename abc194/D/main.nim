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


proc solve(N: int): void =
  var psum = 0.0
  var i = 1.0
  var nn = (N-1).toFloat / N.toFloat

  while true:
    var p = i * pow(nn, i) * (1 / (N.toFloat))
    psum += p
    # dump (i, p, psum)

    if p < 10e-8: break

    i += 1.0

  echo psum

proc main(): void =
  var N = 0
  N = nextInt()
  solve(N);
  return

main()
