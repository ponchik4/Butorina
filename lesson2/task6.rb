check = {}
check2 = {}
total = 0

loop do
      puts "Введите название товара, если товаров больше нет введите 'стоп'"
      product = gets.chomp
      break if product == "стоп"
      puts "Введите цену за единицу"
      price = gets.to_f
      puts "ведите кол-во купленного товара"
      quantity = gets.to_f

  check[product] = { price: price, quantity: quantity }
  check2[product] = price * quantity
  total = total + check2[product]
end

puts check
puts "Итоговая сумма за каждый товар: #{check2}"
puts "Всего на сумму: #{total}"
