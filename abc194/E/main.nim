import sequtils, tables
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


proc solve(N: int, M: int, A: seq[int]): void =
  var h = initCountTable[int]()
  var minimum = int.high

  for i in 0..<M:
    h.inc(A[i])

  if h[0] == 0:
    echo 0
    return

  for n in h.keys:
    if h[n+1] == 0 and n+1 < minimum:
      minimum = n + 1

  for i in M..<N:
    h.inc(A[i])
    h[A[i-M]] = h[A[i-M]] - 1

    if minimum > A[i-M]:
      for n in h.keys:
        if h[n+1] == 0 and n + 1 < minimum:
          minimum = n + 1

  echo minimum


proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
  solve(N, M, A);
  return

main()
