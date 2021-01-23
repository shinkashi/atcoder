import sequtils, sugar, algorithm
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


proc solve(N:int, A:seq[int]):void =
  # var L = newSeq[int](N)
  # var R = newSeq[int](N)

  var area = 0

  for i in 0..<N:

    var h = A[i]    

    var l = i
    while l >= 0 and A[l] >= h:
      dec l

    var r = i
    while r < N and A[r] >= h:
      inc r

    inc l
    dec r
  
    area = max(area, (r-l+1)*h)

  echo area

proc main():void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
      A[i] = nextInt()
  solve(N, A);
  return

main()
