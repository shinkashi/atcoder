import sequtils, algorithm, sugar
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


proc solve(N: int, K: int, A: seq[seq[int]]): void =

  proc createPond(y, x, K: int): seq[int] =
    for yi in y..<y+K:
      for xi in x..<x+K:
        result.add A[yi][xi]

  proc getMedian(pond: var seq[int]): int =
    pond.sort(order = Descending)
    pond[(pond.len div 2)]

  proc selectMedian(pond: seq[int]): int =
    var pond = pond
    for i in 0..K:
      var minIndex = i
      var minValue = pond[i]
      for j in i+1..<pond.len:
        if pond[j] < minValue:
          minIndex = j
          minValue = pond[j]
      swap pond[i], pond[minIndex]
    return pond[pond.len - (pond.len div 2) - 1]

  var minMedian = int.high
  for y in 0..N-K:
    var pond = createPond(y, 0, K)
    var median = selectMedian(pond)
    dump (y, 0, pond, median)
    minMedian = min(minMedian, median)
    for x in 1..N-K:
      var pond = createPond(y, x, K)
      var median = selectMedian(pond)
      dump (y, x, pond, median)
      minMedian = min(minMedian, median)


  echo minMedian

proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  var A = newSeqWith(N, newSeqWith(N, 0))
  for i in 0..<N:
    for j in 0..<N:
      A[i][j] = nextInt()
  solve(N, K, A);
  return

main()
