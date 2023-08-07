require 'json'

class AuthorGame
  def get_data(file)
    file_data = File.read(file)
    JSON.parse(file_data)
  rescue StandardError
    puts 'Error !'
  end

  def save_game
    ''
  end

  def save_author
    ''
  end
end

dec = AuthorGame.new
puts dec.get_data('author.json')
