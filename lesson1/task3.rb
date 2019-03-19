puts "Укажите длинну трех сторон треугольника"
a=gets.chomp.to_f
b=gets.chomp.to_f
c=gets.chomp.to_f

if a == b &&  a == c
  puts "Треугольник равнобедренный равносторонний"
elsif a==b || c==a || b==c
  puts "Треугольник равнобедренный"
elsif a**2+b**2==c**2 || a**2+c**2==b**2|| b**2+c**2==a**2
  puts "Треугольник прямоугольный"
else
  puts "Треугольник какой-то"
end
