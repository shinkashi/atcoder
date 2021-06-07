import sequtils
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


proc solve(x: int, y: int): void =
  if x == y:
    echo x
  else:
    echo 3 - (x + y)


proc main(): void =
  var x = 0
  x = nextInt()
  var y = 0
  y = nextInt()
  solve(x, y);
  return

main()
