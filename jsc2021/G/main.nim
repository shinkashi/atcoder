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

let MOD = 1000000007

proc solve(N:int, A:seq[seq[int]]):void =
  discard

proc main():void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, newSeqWith(N, 0))
  for i in 0..<N:
    for j in 0..<N:
      A[i][j] = nextInt()
  solve(N, A);
  return

main()
