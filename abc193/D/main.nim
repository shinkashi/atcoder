import sequtils, math, strutils, sugar
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


proc point(s: seq[int]): int =
  result = 0
  for i in 1..9:
    result += i * (10 ^ s.count(i))

proc solve(K: int, S: string, T: string): void =
  var s = S[0..3].toSeq().mapIt(parseInt($it))
  var t = T[0..3].toSeq().mapIt(parseInt($it))
  var a = concat(s, t)
  var rem: array[1..9, int]
  for i in 1..9:
    rem[i] = K - a.count(i)

  var remCards = 9*K - 8

  var p = 0.0;
  var cnt = 0;

  for xs in 1..9:
    if rem[xs] == 0: continue
    for xt in 1..9:
      if rem[xt] == 0: continue
      if xs == xt and rem[xt] == 1: continue

      var ps = rem[xs] / remCards
      var pt: float
      if xs != xt:
        pt = rem[xt] / (remCards - 1)
      else:
        pt = (rem[xt] - 1) / (remCards - 1)

      var pst = ps * pt

      var shand = concat(s, @[xs])
      var thand = concat(t, @[xt])
      # dump (shand, thand, point(shand), point(thand))

      if point(shand) > point(thand):
        inc cnt
        # dump (cnt)
        p += pst

  echo p


proc main(): void =
  var K = 0
  K = nextInt()
  var S = ""
  S = nextString()
  var T = ""
  T = nextString()
  solve(K, S, T);
  return

main()
