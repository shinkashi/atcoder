import sequtils, tables, sugar, algorithm
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
  var f: CountTable[int]
  var amax = 0

  for ai in a: 
    f.inc(ai)
    amax = max(amax, ai)

  var cnt = 0
  var balls = K
  
  for i in 0..amax:
    balls = min(balls, f[i])
    if balls == 0: break
    cnt += balls

  echo cnt

  # var fkeys = toSeq(f.keys).sorted
  # var prev = fkeys[0]
  # var balls = f[0]

  # for i in fkeys:
    # # dump((i, prev, balls, cnt))
    # cnt += (i - prev) * balls
    # balls = min(balls, f[i])
    # prev = i


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
