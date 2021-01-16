import sequtils, algorithm
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


proc solve(N:int, a: var seq[int]):void =
  var Alice = 0
  var Bob = 0
  a.sort(SortOrder.Descending)
  for i in countup(0, a.len-1, 2):  Alice += a[i]
  for i in countup(1, a.len-1, 2):  Bob += a[i]
  echo Alice - Bob

proc main():void =
  var N = 0
  N = nextInt()
  var a = newSeqWith(N, 0)
  for i in 0..<N:
      a[i] = nextInt()
  solve(N, a);
  return

main()
