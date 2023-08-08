require './game'

class AddGame
  def initialize
    print 'Multiplayer: '
    @multiplayer = gets.chomp

    print 'Last played at: '
    @last_played_at = gets.chomp
  end

  def add_game(externa_data)
    data = Game.new(@multiplayer, @last_played_at)
    return unless externa_data.is_a?(Array)

    externa_data.push(data)
  end
end
