import sequtils, tables
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


proc solve(X:int, Y:int):void =
    var memo: Table[int, int]

    proc dp(y: int): int =
      if memo.hasKey(y): return memo[y]

      result = if y == 1: abs(X-y)
        elif (y and 1) == 1:
          [abs(X-y), dp((y+1) div 2) + 2, dp((y-1) div 2) + 2].min
        else: [abs(X-y), dp(y div 2) + 1].min

      memo[y] = result

    echo dp(Y)


proc main():void =
  var X = 0
  X = nextInt()
  var Y = 0
  Y = nextInt()
  solve(X, Y);
  return

main()
