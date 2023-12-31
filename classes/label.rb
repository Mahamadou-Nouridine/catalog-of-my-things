class Label
  attr_accessor :items, :name, :id, :title, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def object_to_hash
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items.map(&:object_to_hash)
    }
  end

  def necessary_info
    {
      'title' => @title,
      'color' => @color
    }
  end
end
