import sequtils, algorithm
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

proc solve(A: var seq[int]): void =
  A.sort()
  if A[1] - A[0] == A[2] - A[1]:
    echo YES
  else:
    echo NO

proc main(): void =
  var A = newSeqWith(3, 0)
  for i in 0..<3:
    A[i] = nextInt()
  solve(A);
  return

main()
