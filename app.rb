require_relative 'classes/music_album'
require_relative 'classes/genre'
require_relative 'classes/preserve_data'
require_relative 'classes/get_item_metadata'
require_relative 'classes/add_author'
require_relative 'classes/game'
require_relative 'classes/book'
require_relative 'classes/label'
require 'json'

class App
  include GetMetadata
  def initialize
    @preserve_data = PreserveData.new
    @preserve_data.create_files
  end

  def add_music_album
    print 'Publication date:'
    publish_date = gets.chomp
    print 'Is the Music album on spotify? [y/n]:'
    on_spotify = gets.chomp.to_s.downcase
    puts 'Out of range' unless %w[y n].include?(on_spotify)
    on_spotif = on_spotify == 'y'
    music = MusicAlbum.new(publish_date, on_spotify: on_spotif)
    author = get_author(music)
    label = get_label(music)
    genre = get_genre(music)
    music_hash = music.object_to_hash.merge({
                                              'author' => author,
                                              'label' => label,
                                              'genre' => genre
                                            })
    @preserve_data.save('data/music_albums.json', music_hash)
    @preserve_data.save('data/authors.json', author)
    @preserve_data.save('data/label.json', label)
    @preserve_data.save('data/genres.json', genre)
    puts 'Music album added successfully!'
  end

  def add_book
    puts 'A) Publication date (format: yyyy-mm-dd) :'
    publish_date = gets.chomp
    puts 'B) Name of publisher :'
    publisher = gets.chomp
    puts 'C) State of book cover (Bad or Good) :'
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = get_label(book)
    @preserve_data.save('data/books.json',
                        { 'id' => book.id, 'publish_date' => book.publish_date, 'publisher' => book.publisher,
                          'cover_state' => book.cover_state })
    @preserve_data.save('data/label.json', label)
    puts 'New book successfully added!'
  end

  def list_books
    books = @preserve_data.get_data('data/books.json')
    puts 'The list is empty!' if books.empty?
    books.each do |book|
      pname = book['publisher']
      pdate = book['publish_date']
      state = book['cover_state']
      puts "\n[Book] Publisher : #{pname} | Published at: #{pdate} | Cover Condition/State: #{state}\n\n"
    end
  end

  def list_labels
    labels = @preserve_data.get_data('data/label.json')
    puts 'The list is empty!' if labels.empty?
    labels.each_with_index do |label, index|
      puts "\n#{index + 1}) [Label] Title: #{label['title']} | Label Color: #{label['color']}\n\n"
    end
  end

  def list_music_albums
    music_albums = @preserve_data.get_data('data/music_albums.json')
    puts 'The list is empty!' if music_albums.empty?
    music_albums.each_with_index do |music, index|
      author = music['author'].nil? ? 'Unknown' : music['author']['first_name']
      genre = music['genre'].nil? ? 'Unknown' : music['genre']['name']
      puts "#{index}) [Music Album] Author: #{author}, Genre: #{genre}, Published at: #{music['publish_date']}"
    end
  end

  def list_genres
    genres = @preserve_data.get_data('data/genres.json')
    puts 'The list is empty!' if genres.empty?
    genres.each_with_index do |genre, index|
      puts "#{index}) #{genre['name']}"
    end
  end

  def list_authors
    authors = @preserve_data.get_data('data/authors.json')
    puts 'The list is empty!' if authors.empty?
    authors.each { |author| puts "[Author] First name : #{author['first_name']} | Last name: #{author['last_name']}\n" }
  end

  def list_games
    games = @preserve_data.get_data('data/games.json')
    puts 'The list is empty!' if games.empty?
    games.each do |game|
      puts "[Game] Multiplayer : #{game['multiplayer']} | Last played_at: #{game['last_played']}\n"
    end
  end

  def add_game
    print 'Publish date: '
    publish = gets.chomp

    print 'Multiplayer [y/n]: '
    multiplayer = gets.chomp
    puts 'Out of range' unless %w[y n].include?(multiplayer)
    multiplayer = multiplayer == 'y'

    print 'Last played at: '
    last_played_at = gets.chomp
    game = Game.new(publish, multiplayer, last_played_at)
    @preserve_data.save('data/games.json',
                        { 'id' => game.id, 'publish_date' => game.publish_date, 'multiplayer' => game.multiplayer,
                          'last_played' => game.last_played_at })
    AddAuthor.new('data/authors.json', game)
    puts "Game added successfully!\n"
  end
end
