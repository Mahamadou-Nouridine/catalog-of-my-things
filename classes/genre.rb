class Genre
  attr_accessor :name, :items

  def initialize(name)
    @id = rand(0..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_genre(self)
  end
end
