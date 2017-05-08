class Book < Product
  attr_accessor :title, :genre, :author

  def self.from_file(url)
    lines = File.readlines(url, encoding: "UTF-8")

    self.new(
      title: lines[0].chomp,
      genre: lines[1].chomp,
      author: lines[2].chomp,
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга #{@title}, #{@genre}, автор - #{@author}, #{super}"
  end
end