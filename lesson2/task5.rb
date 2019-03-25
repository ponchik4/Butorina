puts "Введите день:"
day = gets.to_i

puts "Введите месяц:"
month = gets.to_i

puts "Введите год:"
year = gets.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

leap_year = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0

today = day
months[1] = 29 if leap_year
today += months.first(month - 1).sum
puts "Сегодня #{today}-й день"
