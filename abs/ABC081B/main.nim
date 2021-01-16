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

let MOD = 2

proc solve(N:int, A:seq[int]):void =
  var x = A.foldl(a or b)
  var c = 0
  while (x and 1) == 0:
    inc c
    x = x shr 1
  echo c

proc main():void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
      A[i] = nextInt()
  solve(N, A);
  return

main()
