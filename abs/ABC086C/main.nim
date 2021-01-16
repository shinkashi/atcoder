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

let YES = "Yes"
let NO = "No"

# import sugar

proc solve(N:int, t:var seq[int], x:var seq[int], y:var seq[int]):void =
  t.insert(0)
  x.insert(0)
  y.insert(0)

  for i in 1..N:
    var t = t[i]-t[i-1]
    var x = abs(x[i]-x[i-1])
    var y = abs(y[i]-y[i-1])

    var moves = x+y
    # dump((t, x, y, moves, t-moves))

    if t < moves:
      echo NO
      return

    if (t - moves) mod 2 == 1:
      echo NO
      return

  echo YES

proc main():void =
  var N = 0
  N = nextInt()
  var t = newSeqWith(N, 0)
  var x = newSeqWith(N, 0)
  var y = newSeqWith(N, 0)
  for i in 0..<N:
      t[i] = nextInt()
      x[i] = nextInt()
      y[i] = nextInt()
  solve(N, t, x, y);
  return

main()
