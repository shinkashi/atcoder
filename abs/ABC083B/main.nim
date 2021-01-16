import sequtils, strutils, math
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


proc solve(N:int, A:int, B:int):void =
  var total = 0;
  for n in 1..N:
    if toSeq($n).mapIt($it).map(parseInt).sum in A..B:
      total += n
  
  echo total

proc main():void =
  var N = 0
  N = nextInt()
  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  solve(N, A, B);
  return

main()
