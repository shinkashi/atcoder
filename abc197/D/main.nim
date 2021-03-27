import sequtils, complex, math
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



proc main(): void =
  var N = nextFloat()
  var x0 = nextFloat()
  var y0 = nextFloat()
  var xN2 = nextFloat()
  var yN2 = nextFloat()

  var xc = (x0 + xN2)/2
  var yc = (y0 + yN2)/2

  var x0m = x0 - xc
  var y0m = y0 - yc

  var c0 = Complex64(re: x0m, im: y0m)
  var (c0r, c0phi) = c0.polar()
  c0phi += 2 * PI / N
  var c1 = rect(c0r, c0phi)
  var (x1m, y1m) = (c1.re, c1.im)

  var x1 = x1m + xc
  var y1 = y1m + yc

  echo x1, " ", y1

main()
