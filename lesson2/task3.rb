arr = [1, 1]
next_number = 2
while next_number < 100
  arr << next_number
  (next_number = arr[-1] + arr[-2])
end
puts arr
