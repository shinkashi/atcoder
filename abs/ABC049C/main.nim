import sequtils, strutils
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

let YES = "YES"
let NO = "NO"

proc solve(S:var string):void =
  while S.len > 0:
    block hoge:
      for c in ["dream","dreamer","erase","eraser"]:
        if S.endsWith(c):
          # S = S.substr(0, S.len - 1 - c.len)
          S.removeSuffix(c)
          break hoge
      echo NO
      return

  echo YES
  return


proc main():void =
  var S = ""
  S = nextString()
  solve(S);
  return

main()
