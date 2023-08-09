class Author
  attr_reader :id, :items, :first_name, :last_name

  def initialize(first_name, last_name)
    @id = rand(1..1_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def object_to_hash
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items.map(&:object_to_hash)
    }
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
