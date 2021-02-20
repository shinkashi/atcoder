import sequtils, algorithm, strutils
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

proc g1(x: int): int =
  var s: seq[char] = toSeq($x)
  s.sort(order = SortOrder.Descending)
  return s.join("").parseInt()

proc g2(x: int): int =
  var s: seq[char] = toSeq($x)
  s.sort()
  return s.join("").parseInt()

proc solve(N: int, K: int): void =
  # echo g1(3021)
  # echo g2(3021)

  var n = N
  for k in 1..K:
    n = g1(n) - g2(n)
  echo n

proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  solve(N, K);
  return

main()
