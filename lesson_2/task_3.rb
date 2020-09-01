# Заполнить массив числами фибоначчи до 100

arr = [0, 1]

loop do
  if 100 > tmp = arr[-1] + arr[-2]
    arr << tmp
  else
    break
  end
end

puts arr
