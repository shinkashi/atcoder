import sequtils, math, tables, sugar
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

var mods: array[0..9, seq[int]]

proc createMods =
  mods[0] = @[0]
  for i in 1..9:
    var x = i
    while x notin mods[i]:
      mods[i].add(x)
      x = (x * i) mod 10
  dump mods
  dump mods.map(series => series.map(x => x mod 4))


proc powLastDigit(X, Y: int): int =
  var x = X mod 10
  if x == 0: return 0
  if Y == 0: return 1
  var steps = (Y - 1) mod (mods[x].len)
  # if steps == 0: return 1
  # steps -= 1
  # dump (X, Y, x, mods[x], steps)
  return mods[x][steps]


proc solve(A: int, B: int, C: int): void =
  var BC = 1
  for i in 0..C mod 30:
    BC = (BC * B) mod 30
  # var BC = B ^ (C mod 4)
  var ABC = powLastDigit(A, BC)
  echo ABC


proc main(): void =
  createMods()

  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  var C = 0
  C = nextInt()
  solve(A, B, C);
  return

main()
