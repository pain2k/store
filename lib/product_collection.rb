class ProductCollection
  attr_reader :sum
  PRODUCT_TYPES = {
    film: {dir: "films", class: Film},
    book: {dir: "books", class: Book},
    disc: {dir: "discs", class: Disc}
  }

  def initialize(products = [])
    @products = products
    @purchase_list = []
    @sum = 0
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]

      product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end


    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
      when :title
        @products.sort_by! { |product| product.to_s }
      when :price
        @products.sort_by! { |product| product.price }
      when :amount
        @products.sort_by! { |product| product.amount }
    end

    @products.reverse! if params[:order] == :asc

   self
  end

  def show
    @products.each_with_index do |product, index|
      puts "#{index + 1}. #{product}"
    end
    puts "0. Выход"
    print ">"
  end


  def calc(user_choice)
    if user_choice == 0
      return
    elsif user_choice > @products.size
      puts
      puts "Неправильный ввод, повторите попытку"
      puts
    else
      @sum += @products[user_choice - 1].price
      @purchase_list << @products[user_choice - 1]
      @products[user_choice - 1].amount -= 1
      @products.delete_if { |product| product.amount == 0 }
      puts
      puts "Вы выбрали товаров на сумму: #{@sum} руб."
    end

  end

  def choosen
    @purchase_list
  end

end