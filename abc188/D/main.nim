import heapqueue

import sequtils
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

type Evt = object
  time: int
  diff: int

proc `<`[Evt](a, b: Evt): bool = a.time < b.time

proc solve(N: int, C: int, a: seq[int], b: seq[int], c: seq[int]): void =

  var events = initHeapQueue[Evt]()
  for i in 0..<N:
    events.push Evt(time: a[i], diff: c[i])
    events.push Evt(time: b[i]+1, diff: -c[i])

  var prevTime = 0;
  var prevPrice = 0;
  var totalCost = 0;  

  while events.len() > 0:
    var event = events.pop()
    # echo event

    # close previous section
    var elapsedTime = event.time - prevTime
    var price = min(prevPrice, C)
    totalCost += elapsedTime * price

    # prepare this section
    prevTime = event.time
    prevPrice += event.diff

  echo totalCost


proc main(): void =
  var N = 0
  N = nextInt()
  var C = 0
  C = nextInt()
  var a = newSeqWith(N, 0)
  var b = newSeqWith(N, 0)
  var c = newSeqWith(N, 0)
  for i in 0..<N:
    a[i] = nextInt()
    b[i] = nextInt()
    c[i] = nextInt()
  solve(N, C, a, b, c);
  return

main()
