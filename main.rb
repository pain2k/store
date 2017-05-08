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

sum = 0
purchase = []
user_choice = nil
until user_choice == 0 do
  collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end
  puts "0. Выход"
  print ">"
  user_choice = STDIN.gets.to_i
  if user_choice == 0
    break
  else
    sum += collection.to_a[user_choice - 1].price
    purchase << collection.to_a[user_choice - 1].to_s
    puts "Вы выбрали товаров на сумму: #{sum} руб."
  end
end
puts "Вы купили:"
puts purchase
puts "С Вас - #{sum} руб. Спасибо за покупки!"


