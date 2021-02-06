import sequtils, math, sugar
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)
proc nextFloat(): float = scanf("%lf",addr result)
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

const FACTOR = 10000

proc floorf(x: int): int =
  result = (x div FACTOR)
  if result < 0:
    result -= 1
  result *= FACTOR

proc ceilf(x: int): int =
  result = floorf(x)
  if x mod FACTOR > 0:
    result += FACTOR

proc solve(X:float, Y:float, R:float):void =
  if R < 0.0001:
    echo 0
    return

  var x = (X * FACTOR).round.int
  var y = (Y * FACTOR).round.int
  var r = (R * FACTOR).round.int

  var 
    ylow = ceilf(y - r)
    yhigh = floorf(y + r)
    q = ylow
    cnt = 0

  # dump((ylow, yhigh))

  while q <= yhigh:
    # var pp = sqrt(R2 - pow(Y - q, 2))
    var pp = (r + (y - q)) * (r - (y - q))
    var ppf = sqrt(pp.float).int

    var xlow = ceilf(x - ppf)
    var xhigh = floorf(x + ppf)

    # dump (xlow, xhigh)

    if xlow <= xhigh:
      cnt += 1 + ((xhigh - xlow) div FACTOR)
    q += FACTOR.toInt

  echo cnt


proc main():void =
  var X = 0.0
  X = nextFloat()
  var Y = 0.0
  Y = nextFloat()
  var R = 0.0
  R = nextFloat()
  solve(X, Y, R);
  return

main()
