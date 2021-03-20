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

  proc next(y, x: int): (int, int) =
    if x < W-1:
      return (y, x+1)
    else:
      return (y+1, 0)

  proc lay(y, x, a, b: int) =
    when false:
      for y in 0..<H:
        for x in 0..<W:
          stdout.write(floor[y][x])
        stdout.write("*\n")
      stdout.write("*".repeat(W+1) & "\n")

    if y >= H:
      cnt += 1
      return

    if floor[y][x] != ' ':
      var (ny, nx) = next(y, x)
      lay(ny, nx, a, b)
      return

    if a > 0:
      if x < W-1 and floor[y][x+1] == ' ':
        floor[y][x] = '-'
        floor[y][x+1] = '-'
        var (ny, nx) = next(y, x)
        lay(ny, nx, a-1, b)
        floor[y][x] = ' '
        floor[y][x+1] = ' '

      if y < H-1 and floor[y+1][x] == ' ':
        floor[y][x] = '|'
        floor[y+1][x] = '|'
        var (ny, nx) = next(y, x)
        lay(ny, nx, a-1, b)
        floor[y][x] = ' '
        floor[y+1][x] = ' '

    if b > 0:
      floor[y][x] = '*'
      var (ny, nx) = next(y, x)
      lay(ny, nx, a, b-1)
      floor[y][x] = ' '

  lay(0, 0, A, B)
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
