require_relative '../../classes/author'
require_relative '../../classes/item'

# frozen_string_literal: true

describe Author do
  context 'add item' do
    it 'should add the item to the author' do
      item = Item.new('22-2-2023')
      author = Author.new('John', 'Doe')

      expect(author.add_item(item)).to include(item)
    end

    it 'should return the item and the index of the item' do
      item = Item.new('2-2-2023')
      item2 = Item.new('21-1-2010')

      author = Author.new('Laurent', 'Zai')
      author.add_item(item2)

      result = author.add_item(item)

      expect(result).to be_an_instance_of(Array)
      expect(result[0]).to eq(item2)
      expect(result[1]).to eq(item)
    end
  end
end
