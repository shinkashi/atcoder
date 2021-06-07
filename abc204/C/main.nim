import sequtils, tables, sets
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


proc solve(N: int, M: int, A: seq[int], B: seq[int]): void =
  var dest = initTable[int, seq[int]]()
  for m in 0..<M:
    if not dest.hasKey(A[m]-1):
      dest[A[m]-1] = @[]
    dest[A[m]-1].add(B[m]-1)

  var total = 0

  for n in 0..<N:
    # echo "n", n
    var visited = initHashSet[int]()

    proc dfs(cur: int) =
      if cur in visited: return
      visited.incl(cur)
      if dest.hasKey(cur):
        for d in dest[cur]: dfs(d)

    dfs(n)

    total += visited.len

  echo total

proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var A = newSeqWith(M, 0)
  var B = newSeqWith(M, 0)
  for i in 0..<M:
    A[i] = nextInt()
    B[i] = nextInt()
  solve(N, M, A, B);
  return

main()
