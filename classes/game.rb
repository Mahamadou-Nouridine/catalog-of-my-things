require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played)
    @multiplayer = multiplayer
    @last_played_at = last_played
    super(publish_date)
  end

  def object_to_hash
    {
      'publish_date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played' => @last_played_at
    }
  end

  def can_be_archived?
    last_date = Date.parse(@last_played_at)
    return true if (Time.now.year - last_date.year) > 2 and Item.new(Date.parse(publish_date)).can_be_archived?

    false
  end
end
