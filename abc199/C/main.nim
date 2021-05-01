import sequtils, sugar
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



proc main(): void =
  var N = nextInt()
  var S = nextString()
  var Q = nextInt()
  var T, A, B: seq[int]

  var S1, S2: ref string

  var ss1 = S[0..N-1]
  var ss2 = S[N..2*N-1]
  S1 = new string
  S1[] = ss1
  S2 = new string
  S2[] = ss2

  # dump (S1[], S2[])

  for i in 1..Q:
    var T = nextInt()
    var A = nextInt() - 1
    var B = nextInt() - 1

    if T == 1:
      var SA, SB: ref string
      if A < N:
        SA = S1
      else:
        SA = S2
        A -= N

      if B < N:
        SB = S1
      else:
        SB = S2
        B -= N

      # dump (SA[], A, SB[], B)
      (SA[A], SB[B]) = (SB[B], SA[A])

    elif T == 2:
      (S1, S2) = (S2, S1)

  echo S1[], S2[]


main()
