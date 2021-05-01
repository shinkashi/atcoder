import sequtils, re, deques
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


proc solve(S: string): void =
  var T = initDeque[char]()
  var reversed = false
  for i in 0..<S.len:
    # var idx = if reversed: S.len - 1 - i else: i
    if S[i] == 'R':
      reversed = not reversed
    else:
      if reversed:
        T.addFirst(S[i])
      else:
        T.addLast(S[i])

  var R: seq[char]

  while T.len > 0:
    if reversed:
      R.add(T.popLast)
    else:
      R.add(T.popFirst)
    if R.len >= 2 and R[^1] == R[^2]:
      R.setLen(R.len - 2)

  for r in R:
    stdout.write r

  echo ""






proc main(): void =
  var S = ""
  S = nextString()
  solve(S);
  return

main()
