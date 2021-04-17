import sequtils, strutils
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


proc solve(N: int, M: int, A: var seq[int], B: var seq[int]): void =
  var a = 0
  var b = 0
  A.add(int.high)
  B.add(int.high)
  var res: seq[int]
  while not (A[a] == int.high and B[b] == int.high):
    if A[a] == B[b]:
      inc a
      inc b
    elif A[a] < B[b]:
      res.add A[a]
      inc a
    else:
      res.add B[b]
      inc b

  echo res.mapIt($it).join(" ")

proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
  var B = newSeqWith(M, 0)
  for i in 0..<M:
    B[i] = nextInt()
  solve(N, M, A, B);
  return

main()
