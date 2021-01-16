import sequtils
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)
proc nextFloat(): float = scanf("%lf",addr result)
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


proc solve(A:int, B:int, C:int, X:int):void =
  var cnt = 0
  for a in 0..A:
    for b in 0..B:
      var remaining = X - (500*a + 100*b)
      var c = remaining div 50
      if c in 0..C: inc cnt
  echo cnt



proc main():void =
  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  var C = 0
  C = nextInt()
  var X = 0
  X = nextInt()
  solve(A, B, C, X);
  return

main()
