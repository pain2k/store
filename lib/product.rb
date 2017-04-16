class Product
  attr_reader :price, :amount
  def initialize(params)
    @price = params[:price]
    @sum = params[:amount]
  end
end