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


proc solve(A: int, B: int): void =
  var N = A + B
  if N >= 15 and B >= 8:
    echo 1
  elif N >= 10 and B >= 3:
    echo 2
  elif N >= 3:
    echo 3
  else:
    echo 4

proc main(): void =
  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  solve(A, B);
  return

main()
