import sequtils, strformat, sugar
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


proc solve(N:int, Y:int):void =
  for m in countdown(N, 0):
    if m * 10000 > Y: continue
    for g in countdown(N-m, 0):
      var rem = Y - (m * 10000 + g * 5000)
      if rem < 0: continue
      if (rem div 1000) == (N - m - g):
        echo m, " ", g, " ", rem div 1000
        return
  echo "-1 -1 -1"
  return

proc main():void =
  var N = 0
  N = nextInt()
  var Y = 0
  Y = nextInt()
  solve(N, Y);
  return

main()
