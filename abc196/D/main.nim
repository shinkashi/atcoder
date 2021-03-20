import sequtils, sugar, strformat
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


proc solve(H: int, W: int, A: int, B: int): void =
  var floor = newSeqWith(H, newSeqWith(W, ' '))
  var cnt = 0

  proc lay(sy, sx, aTiles: int) =
    dump aTiles
    # for y in 0..<H:
    #   for x in 0..<W:
    #     stdout.write(floor[y][x])
    #   stdout.write("*\n")
    # stdout.write("*".repeat(W+1) & "\n")

    if aTiles == 0:
      cnt += 1
      return

    if aTiles < 0:
      return

    var y = sy
    var x = sx

    while y < H:
      while x < W:
        if floor[y][x] != ' ': continue
        floor[y][x] = '*'
        if x < W-1 and floor[y][x+1] == ' ':
          floor[y][x] = '-'
          floor[y][x+1] = '-'
          lay(y, x, aTiles-1)
          floor[y][x] = ' '
          floor[y][x+1] = ' '

        if y < H-1 and floor[y+1][x] == ' ':
          floor[y][x] = '|'
          floor[y+1][x] = '|'
          lay(y, x, aTiles-1)
          floor[y][x] = ' '
          floor[y+1][x] = ' '

        else:
        #   floor[y][x] = 'x'

        x += 1

      x = 0
      y += 1

  lay(0, 0, A)
  echo cnt


proc main(): void =
  var H = 0
  H = nextInt()
  var W = 0
  W = nextInt()
  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  solve(H, W, A, B);
  return

main()
