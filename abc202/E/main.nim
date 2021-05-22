import sequtils, sets, tables, sugar
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


proc solve(N: int, P: seq[int], Q: int, U: seq[int], D: seq[int]): void =
  var depth: Table[int, HashSet[int]]
  var depth2: Table[int, int]
  depth[0] = toHashSet([1])

  var children: Table[int, HashSet[int]]
  var parents: Table[int, HashSet[int]]

  for i in 2..N:
    if P[i] notin children: children[P[i]] = initHashSet[int]()
    children[P[i]].incl(i)

  # dump children

  proc dfs(i: int, d: int) =
    depth2[i] = d

    if d notin depth:
      depth[d] = initHashSet[int]()
    depth[d].incl(i)

    if i in children:
      for c in children[i]:
        parents[c] = parents[i]
        parents[c].incl(c)
        dfs(c, d + 1)

  parents[1] = [1].toHashSet()
  dfs(1, 0)

  # dump depth2
  # dump parents

  proc checkChild(i: int, d: int): int =
    # dump i
    if d == D[i]: return 1
    var cnt = 0
    for c in children[i]:
      cnt += checkChild(c, d+1)
    return cnt

  for i in 1..Q:
    echo checkChild(U[i], depth2[U[i]])

    # if depth.hasKey(D[i]):
    #   for u in depth[D[i]]:
    #     if U[i] in parents[u]:
    #       inc cnt

    # echo cnt

proc main(): void =
  var N = 0
  N = nextInt()
  var P = newSeqWith(N+1, 0)
  for i in 2..N:
    P[i] = nextInt()
  var Q = 0
  Q = nextInt()
  var U = newSeqWith(Q+1, 0)
  var D = newSeqWith(Q+1, 0)
  for i in 1..Q:
    U[i] = nextInt()
    D[i] = nextInt()
  solve(N, P, Q, U, D);
  return

main()
