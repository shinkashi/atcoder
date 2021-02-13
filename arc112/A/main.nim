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

proc solve(L, R: int) =
  var n = R - 2 * L + 1
  if n > 0:
    echo n * (n+1) div 2
  else:
    echo 0


proc main():void =
  var T = 0
  T = nextInt()
  for i in 0..<T:
    var L = nextInt()
    var R = nextInt()
    solve(L, R)

main()
