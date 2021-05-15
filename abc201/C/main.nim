import sequtils, strutils
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
  var cnt = 0
  for n in 0..9999:
    var ns: string = ("000" & $n)[^4..^1]
    block intloop:
      for i in 0..9:
        if S[i] == 'o' and not contains(ns, $i): break intloop
        if S[i] == 'x' and contains(ns, $i): break intloop
      inc cnt
  echo cnt



proc main(): void =
  var S = ""
  S = nextString()
  solve(S);
  return

main()
