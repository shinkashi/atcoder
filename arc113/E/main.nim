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


proc solve(T:int, S:seq[string]):void =
  discard

proc main():void =
  var T = 0
  T = nextInt()
  var S = newSeqWith(T, "")
  for i in 0..<T:
    S[i] = nextString()
  solve(T, S);
  return

main()
