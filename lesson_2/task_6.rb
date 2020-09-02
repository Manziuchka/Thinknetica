# Сумма покупок. 
# Пользователь вводит поочередно название товара, цену за единицу
# и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести
# произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
# На основе введенных данных требуетеся:
#  Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
#  а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
#  Вывести итоговую сумму за каждый товар.
#  Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

basket = {}
sum = 0

loop do
  puts "Write \"stop\" to finish \n"
  puts "Write product name:"
  product = gets.chomp.downcase

  break if product == "stop"  

  puts "Write price:"
  price = gets.to_f

  puts "Write quantity:"
  quantity = gets.to_f
  
  basket[product] = {'price' => price, 'quantity' => quantity}
end

puts basket

basket.each do |product, price| 
  puts "Total price for the product #{product} = #{tmp = price['price'] * price['quantity']}"
  sum += tmp
end

puts "Amount of the buying = #{sum}"
