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

proc solve(N:string, K:int):void =
  discard

proc main():void =
  var N = ""
  N = nextString()
  var K = 0
  K = nextInt()
  solve(N, K);
  return

main()
