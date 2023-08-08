require 'json'

FILES = ['authors.json', 'genres.json', 'games.json', 'music_albums.json'].freeze

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
    data_from_file = get_data(file)
    file = File.open(file, 'w')
    data_from_file.push(data.object_to_hash)
    file.write JSON.dump(data_from_file)
    return file.close
  rescue StandardError
    puts 'Error!'
  end
end
