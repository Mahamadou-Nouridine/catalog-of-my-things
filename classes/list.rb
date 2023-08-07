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
    return puts "\n There are no authors currently in the database or in your current array.\n" if displayed_data.empty?

    displayed_data.each do |value|
      puts "\n[Author] First name : #{value['first_name']} Last name: #{value['last_name']}\n"
    end
  end
end

ls = List.new
ls.display_authors
