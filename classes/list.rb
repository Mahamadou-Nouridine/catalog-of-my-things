require './auth_game_data'

class List
  def initialize
    @data = AuthorGame.new
  end

  def display_authors(not_saved_value: [])
    saved_data = @data.get_data('author.json')
    return display_list(saved_data.concat(not_saved_value)) unless not_saved_value.empty?

    display_list(saved_data)
  end

  def display_list(displayed_data)
    displayed_data.each do |value|
      puts value
    end
  end
end

ls = List.new
ls.display_authors(not_saved_value: [{ 'name' => 'Safari', 'second' => 'la o' }])
