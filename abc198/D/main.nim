import sequtils, sugar, strutils, algorithm, times
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

template benchmark(benchmarkName: string; code: untyped) =
  block:
    let t0 = epochTime()
    code
    let elapsed = epochTime() - t0
    let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 3)
    echo "CPU Time [", benchmarkName, "] ", elapsedStr, "s"


iterator combination(n, r: int): seq[int] =
  var a = newSeqWith(r, 0)
  for i in 0..<r: a[i] = i

  var i = r - 1
  while a[0] < n - r + 1:

    while i > 0 and a[i] == n - r + i:
      dec i

    yield a
    inc a[i]

    while i < r - 1:
      a[i + 1] = a[i] + 1
      inc i

func permutation[T](nums: seq[T]; k: int): seq[seq[T]] =
  var ans: seq[seq[T]]
  if nums.len < k:
    return @[]

  if k == 1:
    for i in 0..<nums.len:
      ans.add(@[nums[i]])
  else:
    for i in 0..<nums.len:
      var parts = nums
      parts.delete(i, i)
      var row = permutation(parts, k - 1)
      for j in 0..<row.len:
        ans.add(concat(@[nums[i]], row[j]))
  return ans

iterator permutationFast(n, r: int): seq[int] =
  for c in combination(n, r):
    var c = c
    while true:
      yield c
      if not nextPermutation(c):
        break

proc solve(S: seq[string]): void =
  var s0: seq[char] = toSeq(S[0])
  var s1: seq[char] = toSeq(S[1])
  var s2: seq[char] = toSeq(S[2])
  var m: set[char]
  for c in s0: m.incl(c)
  for c in s1: m.incl(c)
  for c in s2: m.incl(c)
  # dump m
  if m.len > 10:
    echo "UNSOLVABLE"
    return

  var ma = toSeq(m)
  var t0 = s0.mapIt(ma.find(it))
  var t1 = s1.mapIt(ma.find(it))
  var t2 = s2.mapIt(ma.find(it))

  # var arys: seq[seq[int]]
  # arys = permutation(toSeq(0..9), m.len)

  # dump arys.len
  for ary in permutationFast(10, m.len):
    # var ary = ary
    if ary[t0[0]] == 0: continue
    if ary[t1[0]] == 0: continue
    if ary[t2[0]] == 0: continue

    var v0 = t0.mapIt(ary[it]).foldl(a * 10 + b)
    var v1 = t1.mapIt(ary[it]).foldl(a * 10 + b)
    var v2 = t2.mapIt(ary[it]).foldl(a * 10 + b)

    # dump (v0, v1, v2)
    if v0 + v1 == v2:
      echo v0
      echo v1
      echo v2
      return

  echo "UNSOLVABLE"


proc main(): void =
  var S = newSeqWith(3, "")
  for i in 0..<3:
    S[i] = nextString()
  solve(S);
  return

main()
