arr = [1, 1]
next_id = 2

while next_id < 100 do
  arr.push(next_id)
  next_id = arr.last + arr[-2]
end

puts arr
