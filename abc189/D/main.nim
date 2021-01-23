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


proc solve(N:int, S:seq[string]): int =

  proc solve2(i:int): int =
    if i == 0:
      case S[i]
      of "OR":
        return 3
      of "AND":
        return 1

    case S[i]
    of "OR":
      return (2 ^ (i+1)) + solve2(i-1)
    of "AND":
      return solve2(i-1)

  return solve2(N-1)

proc main():void =
  var N = 0
  N = nextInt()
  var S = newSeqWith(N, "")
  for i in 0..<N:
      S[i] = nextString()
  echo solve(N, S);


main()
