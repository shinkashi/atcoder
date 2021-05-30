import sequtils, algorithm, sugar
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


proc solve(N: int, K: int, A: seq[int], B: seq[int]): void =
  var friends: seq[(int, int)]
  for n in 0..<N: friends.add((A[n], B[n]))
  friends.sort()
  # dump friends

  var loc = 0
  var money = K
  var nextFriend = 0

  while nextFriend < friends.len:

    var nextFriendLoc = friends[nextFriend][0]
    var nextFriendFund = friends[nextFriend][1]

    # dump (loc, money, nextFriend, nextFriendLoc, nextFriendFund)

    if loc + money >= nextFriendLoc:
      # visit friend
      # echo "visiting friend"
      money -= (nextFriendLoc - loc)
      loc = nextFriendLoc
      money += nextFriendFund
      inc nextFriend
    else:
      break

  # walk
  loc += money
  money = 0
  echo loc
  return


proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  var A = newSeqWith(N, 0)
  var B = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
    B[i] = nextInt()
  solve(N, K, A, B);
  return

main()
