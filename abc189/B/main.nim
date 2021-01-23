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


proc solve(N:int, X:int, V:seq[int], P:seq[int]):void =
  var alc = 0 
  var XX = X * 100  


  for i in 1..N:
    alc += V[i-1] * P[i-1]
    if alc > XX:
      echo i
      return

  echo -1
  return

proc main():void =
  var N = 0
  N = nextInt()
  var X = 0
  X = nextInt()
  var V = newSeqWith(N, 0)
  var P = newSeqWith(N, 0)
  for i in 0..<N:
      V[i] = nextInt()
      P[i] = nextInt()
  solve(N, X, V, P);
  return

main()
