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


proc solve(N:int, S:int, X:string):void =
  discard

proc main():void =
  var N = 0
  N = nextInt()
  var S = 0
  S = nextInt()
  var X = ""
  X = nextString()
  solve(N, S, X);
  return

main()
