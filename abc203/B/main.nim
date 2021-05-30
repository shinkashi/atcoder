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


proc solve(N: int, K: int): void =
  var total = 0
  for n in 1..N:
    for k in 1..K:
      total += n * 100 + k
  echo total

proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  solve(N, K);
  return

main()
