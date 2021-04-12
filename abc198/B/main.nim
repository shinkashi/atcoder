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

proc solve(N: int): void =
  var n = $N
  var b = n.len - 1
  while b > 0 and n[b] == '0': dec b
  var a = 0
  while a < b:
    if n[a] != n[b]:
      echo NO
      return
    inc a
    dec b
  echo YES

proc main(): void =
  var N = 0
  N = nextInt()
  solve(N);
  return

main()
