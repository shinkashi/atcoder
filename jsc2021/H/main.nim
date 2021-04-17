import sequtils, sets, algorithm
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

type Node = ref object
  parent: Node

proc makeSet(): Node =
  result = Node()
  result.parent = result

proc find(n: Node): Node =
  if n == n.parent:
    return n
  else:
    n.parent = find(n.parent)
    return n.parent

proc union(a, b: Node) =
  var
    aRoot = find(a)
    bRoot = find(b)
  bRoot.parent = aRoot

proc main(): void =

  var N = nextInt()
  var M = nextInt()
  var A = newSeqWith(N+1, 0)
  var C = newSeqWith(N+1, 0)
  var X = newSeqWith(M+1, 0)
  var Y = newSeqWith(M+1, 0)
  var nodes = newSeqWith(M+1, makeSet())
  for n in 1..N:
    A[n] = nextInt()
    C[n] = nextInt()

  var F = HashSet[Node]()

  for m in 1..M:
    X[m] = nextInt()
    Y[m] = nextInt()
    F.incl(nodes[X[m]])
    F.incl(nodes[Y[m]])

  var S = HashSet[(int, int)]()
  for i in 1..N: S.incl((C[i], i))

  while S.len > 0:
    var minS = (int.high, 0)
    for s in S: minS = min(minS, s)
    S.excl(s)
    if find(nodes[A[s[1]]]) == find(nodes[B[s[1]]]):
      continue




main()
