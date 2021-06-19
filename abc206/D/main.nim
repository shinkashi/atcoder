import sequtils, tables, heapqueue
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

type Mapping = object
  mp: Table[int, int]
  mismatch: int
  cnt: int

proc `<`(a, b: Mapping): bool = a.cnt < b.cnt

proc solve(N: int, A: seq[int]): void =
  proc updateMap(mp: Table[int, int], frm: int, to: int): Table[int, int] =
    result = mp
    for k, v in result.mpairs:
      if v == frm:
        v = to
    result[frm] = to

  proc countMismatch(mp: Table[int, int]): int =
    for i in 0..<(A.len div 2):
      let a = if mp.hasKey(A[i]): mp[A[i]] else: A[i]
      let b = if mp.hasKey(A[^(i+1)]): mp[A[^(i+1)]] else: A[^(i+1)]
      if a != b: inc result

  var q = initHeapQueue[Mapping]()
  var emptyMP = initTable[int, int]()

  q.push(Mapping(mp: emptyMP, cnt: 0, mismatch: countMismatch(emptyMP)))

  while true:
    while q.len > 0:
      var mapping = q.pop()
      var mismatch = countMismatch(mapping.mp)
      if mismatch == 0:
        echo mapping.cnt
        return
      for i in 0..<(A.len div 2):
        var updatedMP = updateMap(mapping.mp, A[i], A[^(i+1)])
        var mismatch = countMismatch(mapping.mp)
        q.push(Mapping(mp: updatedMP, cnt: mapping.cnt + 1, mismatch: mismatch))

proc main(): void =
  var N = nextInt()
  var A = newSeqWith(N, nextInt())
  solve(N, A)
  return

main()
