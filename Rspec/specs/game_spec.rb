require_relative '../../classes/game'

# frozen_string_literal: true

describe Game do
  context 'can be archived' do
    it 'is true if the game was released more than 10 years ago and the last played date is more than 2 years ago' do
      game = Game.new('22-2-2010', true, '22-2-2020')
      expect(game.can_be_archived?).to eq(true)
    end

    it 'is false if the game was released less than 10 years ago and the last played date is more than 2 years ago' do
      game = Game.new('22-2-2023', true, '22-2-2020')
      expect(game.can_be_archived?).to eq(false)
    end

    it 'is false if the game was released more than 10 years ago and the last played date is less than 2 years ago' do
      game = Game.new('22-2-2010', true, '22-2-2021')
      expect(game.can_be_archived?).to eq(false)
    end
  end
end
