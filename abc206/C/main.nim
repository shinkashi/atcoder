import sequtils, tables
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
# proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld", addr result)
# proc nextFloat(): float = scanf("%lf", addr result)
# proc nextString(): string =
#   var get = false
#   result = ""
#   while true:
#     var c = getchar()
#     if int(c) > int(' '):
#       get = true
#       result.add(c)
#     else:
#       if get: break
#       get = false


proc solve(N: int, A: seq[int]): void =
  var t: Table[int, int]
  # var s: HashSet[int]
  for a in A:
    if not t.hasKey(a):
      t[a] = 0
    inc t[a]
    # if t[a] >= 2:
    #   s.incl(a)

  var total = N * (N-1) div 2

  for dup in t.values:
    # var dup = t[k]
    total -= dup * (dup-1) div 2

  echo total

proc main(): void =
  var N = nextInt()
  var A = newSeqWith(N, nextInt())
  solve(N, A)
  return

main()
