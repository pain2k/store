if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

product = Film.new(title: 'Леон', director: 'Люк Бессон', price: 990)

product.year = 1994
product.amount = 5

puts 'Вот какие товары у нас есть:'
puts
puts product