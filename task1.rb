puts "Укажите имя"
name=gets.chomp

puts "Укажите ваш рост"
height=gets.chomp

if height.to_i-110 < 0
puts "Ваш вес уже оптимальный"

else height.to_i-110 > 0
puts "#{name}, ваш идеальный вес #{height.to_i-110} кг."
end
