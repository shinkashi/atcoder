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


proc solve(a: int, b: int, c: int): void =
  echo (7-a) + (7-b) + (7-c)

proc main(): void =
  var a = 0
  a = nextInt()
  var b = 0
  b = nextInt()
  var c = 0
  c = nextInt()
  solve(a, b, c);
  return

main()
