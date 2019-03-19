puts "Укажите имя"
name = gets.chomp

puts "Укажите ваш рост"
height = gets.to_i

if height - 110 < 0
  puts "Ваш вес уже оптимальный"
else height - 110 > 0
  puts "#{name}, ваш идеальный вес #{height - 110} кг."
end
