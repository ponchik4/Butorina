
loop do
  puts "Введите название товара, если товаров больше нет введите 'стоп'"
  product = gets.chomp
  break if product == "стоп"
  puts "Введите цену за единицу"
  price = gets.to_f
  puts "ведите кол-во купленного товара"
  quantity = gets.to_i
  end
