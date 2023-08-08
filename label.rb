class Label < Item
  attr_accessor :items, :name, :id

  def initialize(title, color)
    super()
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
