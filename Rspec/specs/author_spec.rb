require_relative '../../classes/author'
require_relative '../../classes/item'

# frozen_string_literal: true

describe Author do
  context 'add item' do
    it 'author' do
      item = Item.new('22-2-2023')

      author = Author.new('John', 'Doe')

      expect(author.add_item(item)[0]).to eq(item)
    end

    it 'author' do
      item = Item.new('2-2-2023')
      item2 = Item.new('21-1-2010')

      author = Author.new('Laurent', 'Zai')
      author.add_item(item2)

      expect(author.add_item(item)[1]).to eq(item)
    end
  end
end
