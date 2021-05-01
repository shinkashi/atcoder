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


proc solve(N: int, A: seq[int], B: seq[int]): void =
  var lo = 0
  var hi = int.high
  for i in 0..<N:
    lo = max(lo, A[i])
    hi = min(hi, B[i])

  var num = hi - lo + 1
  if num < 0:
    echo 0
  else:
    echo num

proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
  var B = newSeqWith(N, 0)
  for i in 0..<N:
    B[i] = nextInt()
  solve(N, A, B);
  return

main()
