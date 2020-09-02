# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z').to_a

vowels = ['a', 'e', 'i', 'o', 'u', 'y']

hash = {}

alphabet.each.with_index(1) { |letter, index| hash[letter] = index if vowels.include?(letter)}

puts hash
