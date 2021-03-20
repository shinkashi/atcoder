import sequtils, strutils
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld", addr result)
proc nextFloat(): float = scanf("%lf", addr result)
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


proc solve(N: int): void =
  var i = 1
  var cnt = 0
  while true:
    var res = parseInt($i & $i)
    if res > N: break
    inc cnt
    inc i

  echo cnt

proc main(): void =
  var N = 0
  N = nextInt()
  solve(N);
  return

main()
