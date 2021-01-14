import sequtils, sugar, tables
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

proc solve(N, M: int, A, X, Y: seq[int]) =
  var visitableTown: Table[int, seq[int]]

  for road in 1..M:
    if visitableTown.contains(X[road]):
      visitableTown[X[road]].add(Y[road])
    else: 
      visitableTown[X[road]] = @[Y[road]]

  var dp = newSeqWith(N+1,high(int))
  for i in 1..N:
    if visitableTown.hasKey(i):
      for j in visitableTown[i]:
        dp[j] = [dp[j], dp[i], A[i]].min

  echo (1..N).mapIt(A[it]-dp[it]).max


proc main():void =
  var N = nextInt()
  var M = nextInt()
  var A = newSeqWith(N+1, 0)
  for i in 1..N:
    A[i] = nextInt()
  var X = newSeqWith(M+1, 0)
  var Y = newSeqWith(M+1, 0)
  for i in 1..M:
    X[i] = nextInt()
    Y[i] = nextInt()

  solve(N, M, A, X, Y);
  return


main()
