# Идеальный вес. Программа запрашивает у пользователя имя и рост и выводит
# идеальный вес по формуле (<рост> - 110) * 1.15, после чего выводит результат
# пользователю на экран с обращением по имени. Если идеальный вес получается 
# отрицательным, то выводится строка "Ваш вес уже оптимальный"

puts "Enter your name"
name = gets.chomp

puts "Enter your height"
height = gets.chomp.to_i

weight = (height-110)*1.15

if weight < 0
	puts "Your weight is already perfect"
else
	puts "#{name}, your perfect weight is #{weight}"
end