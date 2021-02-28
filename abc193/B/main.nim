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


proc solve(N: int, A: seq[int], P: seq[int], X: seq[int]): void =
  var min = int.high;
  for n in 0..<N:
    if X[n] - A[n] >= 1:
      if min > P[n]:
        min = P[n]

  if min == int.high:
    min = -1

  echo min


proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, 0)
  var P = newSeqWith(N, 0)
  var X = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
    P[i] = nextInt()
    X[i] = nextInt()
  solve(N, A, P, X);
  return

main()
