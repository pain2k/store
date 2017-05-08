class Disc < Product
  attr_accessor :title, :year, :performer

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8')

    self.new(
      title: lines[0].chomp,
      performer: lines[1].chomp,
      genre: lines[2].chomp,
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def initialize(params)
    super
    @title = params[:title]
    @year = params[:year]
    @performer = params[:performer]
    @genre = params[:genre]
  end

  def to_s
    "Диск #{@title}, #{@year}, #{@genre}, #{@performer}, #{super}"
  end
end
