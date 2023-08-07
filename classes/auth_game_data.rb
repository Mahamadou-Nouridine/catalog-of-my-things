require 'json'

class AuthorGame
  def get_data(file)
    file_data = File.read(file)
    JSON.parse(file_data)
  rescue StandardError
    puts 'The file you are looking for is not present in the current directory'
    []
  end

  def save(file, data)
    data_from_file = get_data(file)
    file = File.open(file, 'w')
    data_from_file = [] unless data_from_file.is_a?(Array)

    data_from_file.push(data)
    file.write JSON.dump(data_from_file)
    file.close
  rescue StandardError
    puts 'Error!'
  end
end