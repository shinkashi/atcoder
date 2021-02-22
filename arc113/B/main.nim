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

const MODSIZE = 40

var mods: array[MODSIZE, seq[int]]

proc createMods =
  mods[0] = @[0]
  for i in 1..<MODSIZE-1:
    var x = i
    while x notin mods[i]:
      mods[i].add(x)
      x = (x * i) mod MODSIZE
  # dump mods

proc powLastDigit(X, Y: int): int =
  var x = X mod MODSIZE
  var y = Y
  if x == 0: return 0
  if y == 0:
    y = mods[x].len
  var steps = (y-1) mod (mods[x].len)
  # if steps == 0: return 1
  # steps -= 1
  # dump (X, Y, x, mods[x], steps)
  return mods[x][steps]


proc solve(A: int, B: int, C: int): void =
  var BC = powLastDigit(B, C)
  var ABC = powLastDigit(A, BC)
  echo ABC mod 10


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
