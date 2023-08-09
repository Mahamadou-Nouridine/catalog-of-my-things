class Author
  attr_reader :id, :item

  def initialize(first_name, last_name)
    @id = rand(1..1_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def object_to_hash
    {
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items.map(&:object_to_hash)
    }
  end

  def add_item(item)
    @items.push(item)
  end
end
