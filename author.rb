class Author
  attr_reader :id, :item

  @item = []

  def initialize(first_name, last_name)
    @id = rand(1..1_000)
    @first_name = first_name
    @last_name = last_name
  end

  def add_item(item)
    @item.push(item)
  end
end
