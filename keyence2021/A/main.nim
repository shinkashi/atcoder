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


proc solve(N:int, a:var seq[int], b:var seq[int]):void =
  a.insert(0)
  b.insert(0)
  var c = newSeqWith(N+1, 0)

  var amax = 0

  for i in 1..N:
      amax = max(amax, a[i])
      c[i] = max(c[i-1], amax * b[i])
      echo c[i]

proc main():void =
  var N = 0
  N = nextInt()
  var a = newSeqWith(N, 0)
  for i in 0..<N:
      a[i] = nextInt()
  var b = newSeqWith(N, 0)
  for i in 0..<N:
      b[i] = nextInt()
  solve(N, a, b);
  return

main()
