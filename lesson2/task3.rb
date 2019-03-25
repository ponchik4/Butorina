arr = [1, 1]
while (next_number = arr[-1] + arr[-2]) < 100
  arr << next_number
end
puts arr
