class Label < Item
  attr_accessor :items, :name, :id

  def initialize(name, title, color)
    super()
    @id = id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end
end
