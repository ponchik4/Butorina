check = {}
total = 0

loop do
puts "Введите название товара, если товаров больше нет введите 'стоп'"
product = gets.chomp
break if product == "стоп"
puts "Введите цену за единицу"
price = gets.to_f
puts "ведите кол-во купленного товара"
quantity = gets.to_f
check[product] = {price: price, quantity: quantity}
end
puts check

check.each do |product_name, product_info|
cost = product_info[:price] * product_info[:quantity]
puts "Сумма за #{product_name} = #{cost}"
total += cost
end
puts "Итого: #{total}"
