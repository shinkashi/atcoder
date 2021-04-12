import sugar, sequtils

func permutation[T](nums: seq[T], k: int): seq[seq[T]] =
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

iterator permutation2[T](nums: seq[T], k: int): seq[T] =
  if k == 1:
    for i in 0..<nums.len:
      yield @[nums[i]]
  else:
    for i in 0..<nums.len:
      var parts = nums
      parts.delete(i)
      for row in permutation(parts, k - 1):
        yield concat(@[nums[i]], row)

for i in permutation2(@['a', 'b', 'c', 'd'], 3):
  echo i

# dump permutation(@['a', 'b', 'c'], 2)

