puts "Введите день:"
day = gets.to_i

puts "Введите месяц:"
month = gets.to_i - 1

puts "Введите год:"
year = gets.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

leap_year = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
months[1] = 29 if leap_year

today = 0
today = day + months.inject(0, :+)
puts "Сегодня #{today} день"
