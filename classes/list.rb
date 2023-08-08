require './auth_game_data'

class List
  def initialize
    @data = AuthorGame.new
  end

  def display_authors(not_saved_value: [])
    saved_data = @data.get_data('author.json')
    return display_list(saved_data.concat(not_saved_value), 1) unless not_saved_value.empty?

    display_list(saved_data, 1)
  end

  def display_games(not_saved_games: [])
    saved_games = @data.get_data('author.json')
    return display_list(saved_games.concat(not_saved_games), 2) unless not_saved_games.empty?

    display_list(saved_games, 2)
  end

  private

  def display_list(displayed_data, option)
    return puts "\nNo authors were found in the database or in your current array.\n" if displayed_data.empty?

    if option == 1
      displayed_data.each do |value|
        puts "[Author] First name : #{value['first_name']} | Last name: #{value['last_name']}\n"
      end
    else
      displayed_data.each do |game|
        puts "[Game] Multiplayer : #{game['multiplayer']} | Last played_at: #{game['last_played_at']}\n"
      end
    end
  end
end

ls = List.new
ls.display_authors(not_saved_value: [{ 'first_name' => 'Safari', 'last_name' => 'Hamuli' }])
ls.display_games(not_saved_games: [{ 'multiplayer' => 'Safari', 'last_played_at' => '22-12-2020' }])
