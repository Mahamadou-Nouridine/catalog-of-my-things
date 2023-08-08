require_relative '../../classes/game'

# frozen_string_literal: true

describe 'Test the game class' do
  context 'can_be_archieved' do
    it 'should the the can_be_archieved method' do
      game = Game.new('22-2-2023', true, '22-2-2023')
      expect(game.can_be_archived?).to eq(false)
    end
  end

  context 'can_be_archieved' do
    it 'should the the can_be_archieved method' do
      game = Game.new('22-2-2010', true, '22-2-2010')
      expect(game.can_be_archived?).to eq(true)
    end
  end
end
