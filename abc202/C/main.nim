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


proc solve(N: int, A: seq[int], B: seq[int], C: seq[int]): void =
  var bj: Table[int, int]

  for j in 1..N:
    var v = bj.getOrDefault(B[C[j]], 0)
    bj[B[C[j]]] = v + 1

  var cnt = 0

  for i in 1..N:
    cnt += bj.getOrDefault(A[i], 0)

  echo cnt

proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N+1, 0)
  for i in 1..N:
    A[i] = nextInt()
  var B = newSeqWith(N+1, 0)
  for i in 1..N:
    B[i] = nextInt()
  var C = newSeqWith(N+1, 0)
  for i in 1..N:
    C[i] = nextInt()
  solve(N, A, B, C);
  return

main()
