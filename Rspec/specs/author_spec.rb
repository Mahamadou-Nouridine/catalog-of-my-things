require_relative '../../classes/author'
require_relative '../../classes/item'

# frozen_string_literal: true

describe Author do
  context 'add item' do
    it 'should add the item to the author' do
      item = Item.new('22-2-2023')
      author = Author.new('John', 'Doe')
      author.add_item(item)

      expect(author.items).to include(item)
    end

    it 'should return the item and the index of the item' do
      item = Item.new('2-2-2023')
      item2 = Item.new('21-1-2010')

      author = Author.new('Laurent', 'Zai')
      author.add_item(item2)
      author.add_item(item)
      expect(author.items[0]).to eq(item2)
      expect(author.items[1]).to eq(item)
    end
  end
end
