import sequtils, math
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


proc solve(N:int):void =
    var cnt = 0
    var l = 1
    while l*l < 2*N:
      if 2*N mod l == 0:
        if ((2*N div l) and 1) != (l and 1):
          inc cnt
      inc l

    echo cnt * 2

proc main():void =
  var N = 0
  N = nextInt()
  solve(N);
  return

main()
