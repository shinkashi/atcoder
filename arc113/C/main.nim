import sequtils, sugar
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


proc solve(S: var string): void =
  var cnt = 0
  var rightBound = S.len - 1
  var rightChar = ' '
  for i in countdown(S.len - 3, 0):
    # dump (i, S)
    if S[i] == S[i+1] and S[i+1] != S[i+2]:
      var remainLen = (S.len-1) - (i + 2) + 1
      var found = S[i+2..rightBound].count(S[i])
      if S[i] == rightChar:
        found += (S.len-1 - (rightBound + 1) + 1)
      # dump (remainLen, found)
      cnt += remainLen - found
      rightBound = i-1
      rightChar = S[i]
      # for j in i+2..S.len-1:  S[j] = S[i]
  echo cnt


proc main(): void =
  var S = ""
  S = nextString()
  solve(S);
  return

main()
