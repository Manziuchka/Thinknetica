# Сделать хеш, содержащий месяцы и количество дней в месяце. 
# В цикле выводить те месяцы, у которых количество дней ровно 30

hash = {
  January: 31,
  February: 28,
  March: 31,
  April: 31,
  May: 31,
  June: 30,
  July: 31,
  August: 31,
  September: 30,
  October: 31,
  November: 30,
  December: 31
}

hash.each { |month, day| puts month if day == 30}
