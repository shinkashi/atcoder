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

proc solve(S: string): void =
  for i in 0..<S.len:
    if (i mod 2 == 0 and S[i] in {'A'..'Z'}) or (i mod 2 == 1 and S[i] in {'a'..'z'}):
      echo NO
      return

  echo YES

proc main(): void =
  var S = ""
  S = nextString()
  solve(S);
  return

main()
