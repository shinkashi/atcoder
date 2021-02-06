import times, os, strutils

template benchmark(benchmarkName: string, code: untyped) =
  block:
    let t0 = epochTime()
    code
    let elapsed = epochTime() - t0
    let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 3)
    echo "CPU Time [", benchmarkName, "] ", elapsedStr, "s"

benchmark "benchmark in":
    var aSet = {1..100}
    for i in 0..1_000_000:
        discard 1 in aSet and 2 in aSet

benchmark "benchmark int8":
    type Number = int8
    var aSet: set[Number] = {1.Number..100.Number}
    for i in 0..1_000_000:
        discard {1.Number} * aSet

benchmark "benchmark int16":
    type Number = int16
    var aSet: set[Number] = {1.Number..100.Number}
    for i in 0..1_000_000:
        discard {1.Number} * aSet

