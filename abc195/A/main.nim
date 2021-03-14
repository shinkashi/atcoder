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

let YES = "Yes"
let NO = "No"

proc solve(M: int, H: int): void =
  if H mod M == 0:
    echo YES
  else:
    echo NO

proc main(): void =
  var M = 0
  M = nextInt()
  var H = 0
  H = nextInt()
  solve(M, H);
  return

main()
