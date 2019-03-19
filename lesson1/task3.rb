puts "Укажите длинну трех сторон треугольника"
a = gets.to_f
b = gets.to_f
c = gets.to_f

if a > b && a > c
  h = a
  catet1 = b
  catet2 = c
elsif b > c && b > a
  h = b
  catet1 = a
  catet2 = c
else
  h = c
  catet1 = b
  catet2 = a
end

if catet1**2 + catet2**2 == h**2
  puts "Треугольник прямоугольный"
elsif a == b &&  a == c
  puts "Треугольник равнобедренный равносторонний"
elsif a == b || c == a || b == c
  puts "Треугольник равнобедренный"
else
  puts "Треугольник какой-то"
end
