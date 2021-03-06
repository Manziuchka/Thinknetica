# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)

puts "Enter day, month and year"

day = gets.to_i
month = gets.to_i
year = gets.to_i

days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days[1] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0

number = days.take(month - 1).sum + day

puts "Порядковый номер даты равен #{number}"
