import sequtils, algorithm, sugar, sets
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


proc solveX(N: int, x: seq[int], y: seq[int]): void =
  var m1 = int.low;
  var m2 = int.low;
  for i in 0..<N:
    for j in i+1..<N:
      var m = max(abs(x[i]-x[j]), abs(y[i]-y[j]))
      var mv = @[m1, m2, m]
      mv.sort()
      (m, m2, m1) = mv
  echo m2

proc solve(N: int, x: seq[int], y: seq[int]): void =
  var idx: HashSet[int]

  var xx: seq[(int, int)] = @[]
  for i, d in x: xx.add((d, i))
  xx.sort()
  idx.incl xx[0][1]
  idx.incl xx[1][1]
  idx.incl xx[^1][1]
  idx.incl xx[^2][1]

  var yy: seq[(int, int)] = @[]
  for i, d in y: yy.add((d, i))
  yy.sort()
  idx.incl yy[0][1]
  idx.incl yy[1][1]
  idx.incl yy[^1][1]
  idx.incl yy[^2][1]

  var dists: seq[int]
  var idxa = idx.toSeq()
  for i in 0..<idxa.len:
    for j in i+1..<idxa.len:
      dists.add max(abs(x[idxa[i]]-x[idxa[j]]), abs(y[idxa[i]]-y[idxa[j]]))

  dists.sort()
  echo dists[^2]

proc main(): void =
  var N = 0
  N = nextInt()
  var x = newSeqWith(N, 0)
  var y = newSeqWith(N, 0)
  for i in 0..<N:
    x[i] = nextInt()
    y[i] = nextInt()
  solve(N, x, y);
  return

main()
