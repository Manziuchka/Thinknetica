# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z').to_a

vowels = ['a', 'e', 'i', 'o', 'u', 'y'].to_a

hash = {}

alphabet.each.with_index(1) do |letter, index| 
  if vowels.include?(letter)
    hash[letter] = index
  end
end

puts hash
