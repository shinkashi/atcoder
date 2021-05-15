import sequtils, algorithm
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


proc solve(N: int, S: seq[string], T: seq[int]): void =
  var x = zip(S, T)
  echo x.sortedByIt(-it[1])[1].a

proc main(): void =
  var N = 0
  N = nextInt()
  var S = newSeqWith(N, "")
  var T = newSeqWith(N, 0)
  for i in 0..<N:
    S[i] = nextString()
    T[i] = nextInt()
  solve(N, S, T);
  return

main()
