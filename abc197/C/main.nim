import sequtils, math, sugar
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


proc solve(N: int, A: seq[int]): void =
  var cases: seq[seq[seq[int]]]
  var boxes: seq[seq[int]]

  var minRes = int.high;

  for n in 0..2^(N-1):
    # dump n
    var box: seq[int]
    var res = 0
    var orRes = 0

    for i in 0..<N:
      box.add(A[i])
      orRes = orRes or A[i]
      # dump (n, i, n and (1 shl i))
      if (n and (1 shl i)) != 0:
        res = res xor orRes
        orRes = 0
        boxes.add(box)
        box = @[]

    if box.len != 0:
      res = res xor orRes
      orRes = 0
      boxes.add(box)

    # dump boxes
    cases.add(boxes)
    boxes = @[]

    minRes = min(minRes, res)

  echo minRes

proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
  solve(N, A);
  return

main()
