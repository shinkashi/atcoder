import sequtils, math, strutils, sets
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


proc solve(N: int, M: int, S: seq[string]): void =
  var cnt = 0
  var s: seq[int] = S.map(parseBinInt)
  var ans = newSeqWith(N, newSeqWith(M))
  for i in 0..<N:
    var ansSet = 0
    for m in 0 ..< 2^M:
      var a = (s[i] xor m).toBin(M).count('1')
      ansSet = ansSet or (1 shl a)


  #   var foundflag = false
  #   var found: HashSet[int]
  #   for sx in s:
  #     var sm = sx xor m
  #     var correctAnswers = sm.toBin(M).count('1')
  #     if correctAnswers in found:
  #       foundflag = true
  #       break
  #     found.incl(correctAnswers)
  #   if not foundflag:
  #     inc

  echo cnt

proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var S = newSeqWith(N, "")
  for i in 0..<N:
    S[i] = nextString()
  solve(N, M, S);
  return

main()
