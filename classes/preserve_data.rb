require 'json'

FILES = ['authors.json', 'genres.json', 'games.json', 'music_albums.json', 'books.json', 'labels.json'].freeze

class PreserveData
  def create_files
    FILES.each do |path|
      File.write("./data/#{path}", JSON.generate([])) unless File.exist?("./data/#{path}")
    end
  end

  def get_data(file)
    file_data = File.read(file)
    JSON.parse(file_data)
  rescue StandardError
    puts "\nThe file you are looking for is either not present in the current directory or it is empty.\n\n"
    []
  end

  def save(file, data)
    # This function saves the data to the file.

    # Get the data from the file.
    data_from_file = get_data(file)
    file = File.open(file, 'w')

    # If the data from the file is not an array, convert it to an array.
    data_from_file = [] unless data_from_file.is_a?(Array)

    # If data is not an array, add it to the data from the file.
    unless data.is_a?(Array)
      data_from_file.push(data)
      file.write JSON.dump(data_from_file)
      return file.close
    end

    # Otherwise, concatenate data to the data from the file.
    data_from_file.concat(data)
    file.write JSON.dump(data_from_file)
    file.close
  rescue StandardError
    puts 'Error!'
  end
end
