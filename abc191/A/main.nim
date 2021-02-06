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

proc solve(V:int, T:int, S:int, D:int):void =
  if V*T <= D and D <= V*S:
    echo NO
  else:
    echo YES

proc main():void =
  var V = 0
  V = nextInt()
  var T = 0
  T = nextInt()
  var S = 0
  S = nextInt()
  var D = 0
  D = nextInt()
  solve(V, T, S, D);
  return

main()
