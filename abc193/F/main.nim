import sequtils, sugar
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

proc solve(N: int, c: seq[seq[char]]) =
  for y in 0..<N:
    for x in 0..<N:
      


proc main(): void =
  var N = nextInt()
  var c = newSeqWith(N, newSeqWith(N, ' '))
  discard getchar()
  for y in 0..<N:
    for x in 0..<N:
      c[y][x] = getchar()
    discard getchar()

  solve(N, c)

main()
