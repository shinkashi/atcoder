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


proc solve(N: int, D: float, H: float, d: seq[float], h: seq[float]): void =
  var maxh = 0.0

  for i in 0..<N:
    let h1 = H - h[i]
    let d1 = D - d[i]
    let d2 = D
    let h2 = h1 / d1 * d2
    let h = H - h2
    maxh = max(maxh, h)

  echo maxh

proc main(): void =
  var N = nextInt()
  var D = nextFloat()
  var H = nextFloat()
  var d = newSeqWith(N, 0.0)
  var h = newSeqWith(N, 0.0)
  for i in 0..<N:
    d[i] = nextFloat()
    h[i] = nextFloat()
  solve(N, D, H, d, h);
  return

main()
