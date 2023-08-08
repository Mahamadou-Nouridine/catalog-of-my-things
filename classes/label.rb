class Label
  attr_accessor :items, :name, :id

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include(item)
    item.label = self
  end

  def object_to_hash
    {
      'title' => @title,
      'color' => @color,
      'items' => @items.map(&:object_to_hash)
    }
  end
end
