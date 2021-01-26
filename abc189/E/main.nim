import sequtils, strutils, neo
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

#---------------------------------
proc solve(N: int, X, Y: seq[int], M: int, op: seq[string], Q: int, A, B: seq[int]) =
  # dump((N, X, Y, M, op, Q, A, B))
  # build matrices for op

  var ident = matrix(@[
    @[1.0, 0.0, 0.0],
    @[0.0, 1.0, 0.0],
    @[0.0, 0.0, 1.0],
  ])

  var op1 = matrix(@[
    @[0.0, 1.0, 0.0],
    @[-1.0, 0.0, 0.0],
    @[0.0, 0.0, 1.0],
  ])

  var op2 = matrix(@[
    @[0.0, -1.0, 0.0],
    @[1.0, 0.0, 0.0],
    @[0.0, 0.0, 1.0],
  ])

  func op3(p: float): Matrix[float] = matrix(@[
    @[-1.0, 0.0, p*2.0],
    @[0.0, 1.0, 0.0],
    @[0.0, 0.0, 1.0],
  ])

  func op4(p: float): Matrix[float] = matrix(@[
    @[1.0, 0.0, 0.0],
    @[0.0, -1.0, p*2.0],
    @[0.0, 0.0, 1.0],
  ])

  var opAcc = newSeq[Matrix[float]](M+1)
  opAcc[0] = ident

  for m in 0..<M:
    var opcode, operand: string
    (opcode, operand) = (op[m] & " x").split

    var opMatrix: Matrix[float] = case opcode:
      of "1": op1
      of "2": op2
      of "3": op3(operand.parseFloat)
      of "4": op4(operand.parseFloat)
      else: ident

    opAcc[m+1] = opMatrix * opAcc[m]

  # echo "affin matrix ready"

  for q in 0..<Q:

    # dump q
    # dump B[q]
    # dump X[B[q]-1]
    # dump Y[B[q]-1]
    var coord = matrix(@[
      @[X[B[q]-1].toFloat],
      @[Y[B[q]-1].toFloat],
      @[1.0]
    ])
    # debugEcho coord
    # dump A[q]
    coord = opAcc[A[q]] * coord
    echo coord[0, 0].toInt, " ", coord[1, 0].toInt


proc main(): void =
  var N = nextInt()
  # dump N
  var X = newSeq[int](N)
  var Y = newSeq[int](N)
  for i in 0..<N:
    X[i] = nextInt()
    Y[i] = nextInt()

  var M = nextInt()
  discard stdin.readLine
  var op = newSeq[string](M)
  for i in 0..<M:
    op[i] = stdin.readLine
    op[i].stripLineEnd

  var Q = nextInt()
  var A = newSeq[int](Q)
  var B = newSeq[int](Q)
  for i in 0..<Q:
    A[i] = nextInt()
    B[i] = nextInt()

  solve(N, X, Y, M, op, Q, A, B)

main()
