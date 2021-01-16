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


proc solve(N:int, K:int, a:var seq[int]):void =
  var total = 0

  while true:
    var j = 0
    while a.contains(j):
      var idx = a.find(j)
      a.delete(idx, idx)
      inc j
    if j == 0: break    
    total += j

  echo total

proc main():void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  var a = newSeqWith(N, 0)
  for i in 0..<N:
      a[i] = nextInt()
  solve(N, K, a);
  return

main()
