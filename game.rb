require './item'
require 'date'

class Game < Item
  def initialize(multiplayer, last_played)
    @multiplayer = multiplayer
    @last_played_at = last_played
    super(last_played)
  end

  def can_be_archived?
    last_date = Date.parse(@last_played_at)
    return true if (Time.now.year - last_date.year) > 2 and Item.new(last_date).can_be_archived?

    false
  end
end

df = Game.new(true, '2023-2-2')
puts df.can_be_archived?
