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



proc main(): void =
  var H = nextInt()
  var W = nextInt()
  var Y = nextInt()
  var X = nextInt()
  var S = newSeq[string](H)
  for i in 0..<H:
    S[i] = nextString()

  # dump (H, W, Y, X)

  # Solve
  var cnt = 1
  dec X
  dec Y

  # right
  for x in countup(X+1, W-1):
    if S[Y][x] == '#': break
    inc cnt

  # left
  for x in countdown(X-1, 0):
    if S[Y][x] == '#': break
    inc cnt

  # down
  for y in countup(Y+1, H-1):
    if S[y][X] == '#': break
    inc cnt

  # up
  for y in countdown(Y-1, 0):
    if S[y][X] == '#': break
    inc cnt

  echo cnt

main()
