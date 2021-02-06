import sequtils, math, sugar
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


proc solve(N:int, M:int, A:seq[int], B:seq[int], K:var int, C:var seq[int], D:var seq[int]):void =

  var maxcnt = 0

  # # relevant dishes
  # var relevantDishes: set[int16]
  # for m in 0..<M:
  #   relevantDishes.incl(A[m].int16)
  #   relevantDishes.incl(B[m].int16)

  # for k in countdown(K-1, 0):
  #   if ({C[k].int16, D[k].int16} * relevantDishes == {} ):
  #     C.delete(k)
  #     D.delete(k)
  #     K -= 1
  
  for kpat in 0..<(2^K):
    var dishes: set[int16]
    var kp = kpat

    for k in 0..<K:
      if (kp and 1) == 0:
        dishes.incl(C[k].int16)
      else:
        dishes.incl(D[k].int16)
      kp = kp shr 1

    # dump dishes

    var cnt = 0
    for m in 0..<M:
      # if A[m].int16 in dishes and  B[m].int16 in dishes: 
      if {A[m].int16, B[m].int16} <= dishes: 
        cnt += 1

    maxcnt = max(maxcnt, cnt)  

  echo maxcnt


proc main():void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var A = newSeqWith(M, 0)
  var B = newSeqWith(M, 0)
  for i in 0..<M:
      A[i] = nextInt()
      B[i] = nextInt()
  var K = 0
  K = nextInt()
  var C = newSeqWith(K, 0)
  var D = newSeqWith(K, 0)
  for i in 0..<K:
      C[i] = nextInt()
      D[i] = nextInt()
  solve(N, M, A, B, K, C, D);
  return

main()
