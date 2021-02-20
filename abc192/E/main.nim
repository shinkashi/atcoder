import sequtils, heapqueue, tables
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


proc solve(N: int, M: int, X: int, Y: int, A: seq[int], B: seq[int], T: seq[int],
    K: seq[int]): void =

  var d = newSeqWith[int](N+1, int.high)
  d[X] = 0

  var q = initHeapQueue[(int, int)]()
  q.push((0, X))

  var visited = newSeqWith[bool](N+1, false)

  while q.len > 0:
    var (time, city) = q.pop()

    # if city == Y:
    #   echo time
    #   return

    if d[city] < time:
      continue

    for m in 1..M:
      var nextTime = (((time-1) div K[m]) + 1) * K[m]
      if A[m] == city:
        if d[B[m]] > nextTime + T[m]:
          d[B[m]] = nextTime + T[m]
          q.push((nextTime + T[m], B[m]))
      elif B[m] == city:
        if d[A[m]] > nextTime + T[m]:
          d[A[m]] = nextTime + T[m]
          q.push((nextTime + T[m], A[m]))

  if d[Y] == int.high:
    echo -1
  else:
    echo d[Y]


proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var X = 0
  X = nextInt()
  var Y = 0
  Y = nextInt()
  var A = newSeqWith(M+1, 0)
  var B = newSeqWith(M+1, 0)
  var T = newSeqWith(M+1, 0)
  var K = newSeqWith(M+1, 0)
  for i in 1..M:
    A[i] = nextInt()
    B[i] = nextInt()
    T[i] = nextInt()
    K[i] = nextInt()
  solve(N, M, X, Y, A, B, T, K);
  return

main()
