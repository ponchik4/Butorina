my_hash = { color: 'red'}
my_hash2 = { color: 'white'}

@masiv = [my_hash, my_hash2]



def get_element(color)
  @masiv.each do |b|
    puts b[:color] if b[:color] == color
  end
end

get_element("red")
