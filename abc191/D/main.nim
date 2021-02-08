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

proc solve(X:float, Y:float, R:float):void =
  if R < 0.0001:
    echo 0
    return

  var 
    x = X.float64
    y = Y.float64
    r = R.float64

    ylow = ceil(y - r)
    yhigh = floor(y + r)
    q = ylow
    cnt = 0

  # dump((ylow, yhigh))

  while q <= yhigh:
    # var pp = sqrt(R2 - pow(Y - q, 2))
    var pp = (r + (y - q)) * (r - (y - q))
    var ppf = sqrt(pp)

    var xlow = ceil(x - ppf)
    var xhigh = floor(x + ppf)

    # dump (xlow, xhigh)

    if xlow <= xhigh:
      cnt += (xhigh - xlow).int + 1

    q += 1

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
