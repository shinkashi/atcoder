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

proc gcd(x, y: int): int =
  var (x, y) = (x, y)
  while y > 0:
    (x, y) = (y, x mod y)
  return x

proc solve(A: int, B: int): void =
  var maxGcd = 0
  for x in A..B:
    for y in 1..B-x:
      var g = gcd(x, y)
      if g > maxGcd: maxGcd = g
  echo maxGcd




proc main(): void =
  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  solve(A, B);
  return

main()
