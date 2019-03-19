puts "Укажите три коэффициента"
a = gets.to_f
b = gets.to_f
c = gets.to_f
d = (b**2 - 4 * a * c) * 2

puts "Корней нет" if d < 0

if d > 0
  d_sq = Math.sqrt(d)
  x1 = ((-b) + d_sq) / (2 * a)
  x2 = ((-b) - d_sq) / (2 * a)
  puts "d = #{d}; Х1 = #{x1}; Х2 = #{x2}"
elsif d == 0
  x =  (-b) / (2 * a)
  puts "d = 0; X = #{x}"
end
