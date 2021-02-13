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


proc solve(n:int, p:seq[int]):void =
  type Person = enum Takakashi, Aoki
  var koma = 1
  var coin: seq[bool]
  for i in 1..n:
      coin[i] = true

  proc turn(person: Person, koma: int): int = 
    if coin[koma]:
      coin[koma] = false
      return 1
    else:
      var children = p.filterIt(p[it] == koma and coin[it])
      if children.len == 0:
        if koma == 1:
          







proc main():void =
  var n = 0
  n = nextInt()
  var p = newSeqWith(n-2+1, 0)
  for i in 0..<n-2+1:
    p[i] = nextInt()
  solve(n, p);
  return

main()
