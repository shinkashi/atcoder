import sequtils
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)
proc nextFloat(): float = scanf("%lf",addr result)
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


proc solve(R:int, C:int, A:seq[seq[int]], B:seq[seq[int]]):void =
  discard

proc main():void =
  var R = 0
  R = nextInt()
  var C = 0
  C = nextInt()
  var A = newSeqWith(R, newSeqWith(C-1, 0))
  for i in 0..<R:
    for j in 0..<C-1:
      A[i][j] = nextInt()
  var B = newSeqWith(R-1, newSeqWith(C, 0))
  for i in 0..<R-1:
    for j in 0..<C:
      B[i][j] = nextInt()
  solve(R, C, A, B);
  return

main()
