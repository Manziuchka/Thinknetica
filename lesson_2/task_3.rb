# Заполнить массив числами фибоначчи до 100

arr = [0, 1]

loop do
  break if 100 < tmp = arr.last(2).sum
  arr << tmp
end

puts arr
