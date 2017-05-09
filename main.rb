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
require_relative 'lib/disc'
require_relative 'lib/product_collection'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)

puts "Что хотите купить:"

user_choice = nil
until user_choice == 0 do
  if collection.to_a.size == 0
    puts "К сожалению на прилавке пусто, приходите в другой день!"
    break
  end
  collection.show
  user_choice = STDIN.gets.to_i
  collection.calc(user_choice)
end
puts
puts "Вы купили:"
puts
puts collection.purchase_list
puts
puts "С Вас - #{collection.sum} руб. Спасибо за покупки!"


