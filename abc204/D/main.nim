import sequtils, math
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


proc solve(N: int, T: seq[int]): void =
  var totalTime = T.sum
  var half = totalTime div 2
  var dp = newSeqWith(N+1, newSeqWith(half+1, 0))

  for i in 0..<N:
    for t in 0..half:
      # select ith
      if t - T[i] >= 0:
        dp[i+1][t] = max(dp[i+1][t], dp[i][t-T[i]] + T[i])

      # do not select ith
      dp[i+1][t] = max(dp[i+1][t], dp[i][t])

  var smaller = dp[N][half]
  echo totalTime - smaller


proc main(): void =
  var N = 0
  N = nextInt()
  var T = newSeqWith(N, 0)
  for i in 0..<N:
    T[i] = nextInt()
  solve(N, T);
  return

main()
