require 'json'

class AuthorGame
  def get_data(file)
    file_data = File.read(file)
    JSON.parse(file_data)
  rescue StandardError
    puts 'Error !'
  end

  def save_game(file, data)
    data_from_file = get_data(file)
    file = File.open(file, 'w')
    data_from_file = [] unless data_from_file.is_a?(Array)

    data_from_file.push(data)
    file.write JSON.generate(data_from_file)
  rescue StandardError
    puts 'Error!'
  end

  def save_author
    ''
  end
end

dec = AuthorGame.new
puts dec.save_game('author.json', 'Bonjour')
