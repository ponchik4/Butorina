letters = %w[а о и е ё э ы у ю я]
alph = {}
('а'..'я').each.with_index(1) do |value, key|
  alph[value] = key if letters.include?(value)
end
puts alph
