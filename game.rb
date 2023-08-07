# require_relative 'item'

class Game
  def initialize(multiplayer, last_played)
    @multiplayer = multiplayer
    @last_played_at = last_played
  end

  def can_be_archived?
    return true if (Time.now.year - @last_played_at) > 2  and Item.new(@last_played_at).can_be_archived?

    false
  end
end

df = Game.new(true, 2010)
puts df.can_be_archived?
