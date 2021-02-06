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

let YES = "Yes"
let NO = "No"

proc solve(N:int, S:int, D:int, X:seq[int], Y:seq[int]):void =
  for n in 0..<N:
    if X[n] < S and Y[n] > D:
      echo YES
      return

  echo NO

proc main():void =
  var N = 0
  N = nextInt()
  var S = 0
  S = nextInt()
  var D = 0
  D = nextInt()
  var X = newSeqWith(N, 0)
  var Y = newSeqWith(N, 0)
  for i in 0..<N:
      X[i] = nextInt()
      Y[i] = nextInt()
  solve(N, S, D, X, Y);
  return

main()
