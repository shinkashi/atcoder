import sequtils, math, tables, sets, strutils, sugar
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


var factorMemo: Table[int, seq[int]]

proc factors(n: int): seq[int] =
  if n in factorMemo:
    return factorMemo[n]

  var i = 1
  while i.float <= sqrt(n.float):
    if n mod i == 0:
      result.add(i)
      result.add(n div i)
    inc i

  factorMemo[n] = result

proc solve(N: int): void =
  var res = newSeqWith(N+1, 0)
  for n in 1..N:
    var factors = factors(n)
    var numSet: HashSet[int] = factors.mapIt(res[it]).toHashSet()
    # dump (n, factors, numSet)
    for i in 1..N:
      if i notin numSet:
        res[n] = i
        break

  echo res[1..^1].mapIt($it).join(" ")

proc main(): void =
  var N = 0
  N = nextInt()
  solve(N);
  return

main()
