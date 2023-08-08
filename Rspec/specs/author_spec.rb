require_relative '../../classes/author'

# frozen_string_literal: true

describe Author  do
    context 'add item' do
        it 'author' do
            game = Author.new('John', 'Doe')
            expect(game.add_item).to eq(true)
        end
    end
end
