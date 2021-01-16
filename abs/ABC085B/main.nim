import sequtils, algorithm
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


proc solve(N:int, d:seq[int]):void =
  echo d.deduplicate.len
  

proc main():void =
  var N = 0
  N = nextInt()
  var d = newSeqWith(N, 0)
  for i in 0..<N:
      d[i] = nextInt()
  solve(N, d);
  return

main()
