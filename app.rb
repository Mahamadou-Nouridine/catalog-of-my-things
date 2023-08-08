require_relative 'classes/music_album'
require_relative 'classes/genre'
require_relative 'classes/preserve_data'

class App
  def initialize
    @musics = []
    @genres = []
    @preserve_data = PreserveData.new
    @preserve_data.create_files
  end

  def add_music_album
    puts 'Publication date'
    publish_date = gets.chomp
    print 'Is the Music album on spotify? [y/n]'
    on_spotify = gets.chomp.to_s.downcase
    puts 'Out of range' unless %w[y n].include?(on_spotify)
    on_spotif = on_spotify == 'y'
    music = MusicAlbum.new(publish_date, on_spotify: on_spotif)
    @musics << music
    puts 'Music album added successfully!'
  end

  def list_music_albums
    puts 'The list is umpty!' if @musics.empty?
    @musics.each_with_index do |music, index|
      author = music.author.nil? ? 'Unknown' : music.author.first_name
      genre = music.genre.nil? ? 'Unknown' : music.genre.name
      puts "#{index}) Author: #{author}, Genre: #{genre}, Published at: #{music.publish_date}"
    end
  end

  def list_genres
    puts 'The list is umpty!' if @genres.empty?
    @genres.each_with_index do |genre, index|
      puts "#{index}) #{genre.name}"
    end
  end

  def list_authors
    authors = @preserve_data.get_data('data/authors.json')
    puts 'The list is umpty!' if authors.empty?
    authors.each { |author| puts "[Author] First name : #{author['first_name']} | Last name: #{author['last_name']}\n" }
  end

  def list_games
    games = @preserve_data.get_data('data/games.json')
    puts 'The list is umpty!' if games.empty?
    games.each do |game|
      puts "[Game] Multiplayer : #{game['multiplayer']} | Last played_at: #{game['last_played_at']}\n"
    end
  end
end
