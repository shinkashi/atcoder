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



proc main(): void =
  var N = nextInt()
  var M = nextInt()
  var Q = nextInt()
  var W = newSeqWith(N+1, 0)
  var V = newSeqWith(N+1, 0)
  for n in 1..N:
    W[n] = nextInt()
    V[n] = nextInt()

  var XX = newSeqWith(M+1, 0)
  for m in 1..M:
    XX[m] = nextInt()

  var L = newSeqWith(Q+1, 0)
  var R = newSeqWith(Q+1, 0)
  for q in 1..Q:
    L[q] = nextInt()
    R[q] = nextInt()

  proc calc(L, R: int) =
    var X = XX
    for i in L..R:
      X[i] = 0

    var a = collect(newSeq[int, int], for n in 1..N: (V[n], n))






  # main
  for q in 1..Q:
    echo calc(L, R)



main()
