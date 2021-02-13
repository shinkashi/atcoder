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

let MOD = 1

proc solve(n:int, m:int, c:seq[int], s:seq[seq[int]]):void =
  discard

proc main():void =
  var n = 0
  n = nextInt()
  var m = 0
  m = nextInt()
  var c = newSeqWith(n, 0)
  for i in 0..<n:
    c[i] = nextInt()
  var s = newSeqWith(m, newSeqWith(n, 0))
  for i in 0..<m:
    for j in 0..<n:
      s[i][j] = nextInt()
  solve(n, m, c, s);
  return

main()
