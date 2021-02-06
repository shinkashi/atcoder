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

proc solve(H, W: int, S: seq[seq[char]]) = 
  var cnt =0

  for h in 0..<H-1:
    for w in 0..<W-1:
        var vicinity = 0
        if S[h][w] == '#': inc vicinity
        if S[h][w+1] == '#': inc vicinity
        if S[h+1][w] == '#': inc vicinity
        if S[h+1][w+1] == '#': inc vicinity
        if vicinity in [1, 3]: inc cnt

  echo cnt

proc main():void =
  var H = 0
  H = nextInt()
  var W = 0
  W = nextInt()
  var S = newSeqWith(H, newSeqWith(W, ' '))
  discard getchar()

  for h in 0..<H:
    for w in 0..<W:
      S[h][w] = getchar()
    discard getchar()

  solve(H, W, S)


main()
