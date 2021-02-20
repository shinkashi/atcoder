import sequtils, algorithm, strutils, math, sugar
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


proc asRadix(s: seq[int], radix: int, max: int): int =
  try:
    for i in 0..<s.len:
      result *= radix
      result += s[i]
      if result > max:
        return int.high
  except OverflowError:
    result = int.high
    # result += (radix ^ i) * s[^(i+1)]


proc solve(X: string, M: int): void =
  var s: seq[int] = toSeq[char]($X).mapIt(parseInt($it))
  var ss = s
  ss.sort(order = SortOrder.Descending)
  var maxDigit: int = ss[0]

  var low = maxDigit + 1
  var high = 50

  if asRadix(s, low, M) > M:
    echo 0
    return

  while low < high:
    var mid = low + (high - low) div 2
    var res = asRadix(s, mid, M)

    # dump (low, mid, high, res)

    if res <= M:
      low = mid + 1
    else:
      high = mid

  # dump ("final", low, high)

  echo (low - 1) - (maxDigit+1) + 1

proc main(): void =
  var X = ""
  X = nextString()
  var M = 0
  M = nextInt()

  if X.len == 1:
    echo if X.parseInt <= M: 1 else: 0
    return

  solve(X, M);
  return

main()
