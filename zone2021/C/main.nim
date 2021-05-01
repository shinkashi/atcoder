import sequtils
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


proc solve(N: int, A: seq[int], B: seq[int], C: seq[int], D: seq[int], E: seq[int]): void =
  proc power(i, j, k: int): int =
    [
      max [A[i], A[j], A[k]],
      max [B[i], B[j], B[k]],
      max [C[i], C[j], C[k]],
      max [D[i], D[j], D[k]],
      max [E[i], E[j], E[k]],
    ].min

  var
    i = 0
    j = 1
    k = 2
    maxPower = power(i, j, k)

  for n in 3..<N:
    var
      njk = power(n, j, k)
      ink = power(i, n, k)
      ijn = power(i, j, n)
      maxP = [njk, ink, ijn].max

    if maxP < maxPower: continue
    maxPower = maxP

    if maxP == njk:
      i = n
    elif maxP == ink:
      j = n
    else:
      k = n

  echo maxPower

proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, 0)
  var B = newSeqWith(N, 0)
  var C = newSeqWith(N, 0)
  var D = newSeqWith(N, 0)
  var E = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
    B[i] = nextInt()
    C[i] = nextInt()
    D[i] = nextInt()
    E[i] = nextInt()
  solve(N, A, B, C, D, E);
  return

main()
