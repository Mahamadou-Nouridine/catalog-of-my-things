require_relative 'classes/music_album'
require_relative 'classes/genre'
require_relative 'classes/preserve_data'
require_relative 'classes/get_item_metadata'
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
    author = get_author('data/authors.json', music)
    label = get_label('data/label.json', music)
    genre = get_genre('data/genres.json', music)
    music_album_hash = music.object_to_hash.merge({
                                                    'author' => author,
                                                    'label' => label,
                                                    'genre' => genre
                                                  })
    @preserve_data.save('data/music_albums.json', music_album_hash)
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
    author = get_author('data/authors.json', book)
    label = get_label('data/label.json', book)
    genre = get_genre('data/genres.json', book)
    book_hash = book.object_to_hash.merge({
                                            'author' => author,
                                            'label' => label,
                                            'genre' => genre
                                          })
    @preserve_data.save('data/books.json', book_hash)
    puts 'New book successfully added!'
  end

  def list_books
    books = @preserve_data.get_data('data/books.json')
    puts 'The list is empty!' if books.empty?
    books.each do |book|
      pname = book['publisher']
      pdate = book['publish_date']
      state = book['cover_state']
      author = book['author']['first_name']
      label = book['label']['title']
      genre = book['genre']['name']
      print "\n[Book] Author:#{author} | Label: #{label} | Genre: #{genre} | "
      print "Publisher : #{pname} | Published at: #{pdate} | Cover: #{state}"
    end
    puts "\n\n"
  end

  def list_labels
    labels = @preserve_data.get_data('data/label.json')
    puts 'The list is empty!' if labels.empty?
    labels.each_with_index do |label, index|
      puts "#{index + 1}) [Label] Title: #{label['title']} | Label Color: #{label['color']}"
    end
    puts "\n\n"
  end

  def list_music_albums
    music_albums = @preserve_data.get_data('data/music_albums.json')
    puts 'The list is empty!' if music_albums.empty?
    music_albums.each do |music|
      author = music['author'].nil? ? 'Unknown' : music['author']['first_name']
      genre = music['genre'].nil? ? 'Unknown' : music['genre']['name']
      label = music['label'].nil? ? 'Unknown' : music['label']['title']
      print "\n[Music Album] Author: #{author} | Genre: #{genre} | label: #{label} | "
      print "Published at: #{music['publish_date']} | On spotify: #{music['on_spotify']}"
    end
    puts "\n\n"
  end

  def list_genres
    genres = @preserve_data.get_data('data/genres.json')
    puts 'The list is empty!' if genres.empty?
    genres.each do |genre|
      puts "[Genre] #{genre['name']}"
    end
    puts "\n\n"
  end

  def list_authors
    authors = @preserve_data.get_data('data/authors.json')
    puts 'The list is empty!' if authors.empty?
    authors.each { |author| puts "[Author] First name : #{author['first_name']} | Last name: #{author['last_name']}" }
    puts "\n\n"
  end

  def list_games
    games = @preserve_data.get_data('data/games.json')
    puts 'The list is empty!' if games.empty?
    games.each do |game|
      author = game['author']['first_name']
      label = game['label']['title']
      genre = game['genre']['name']
      print "\n[Game] Author: #{author} | Label: #{label} | Genre: #{genre} | "
      print "Multiplayer : #{game['multiplayer']} | Publish date: #{game['publish_date']} | Last played_at: #{game['last_played']}"
    end
    puts "\n\n"
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
    author = get_author('data/authors.json', game)
    label = get_label('data/label.json', game)
    genre = get_genre('data/genres.json', game)
    game.object_to_hash.merge({
                                'author' => author,
                                'label' => label,
                                'genre' => genre
                              })
    game_album_hash = game.object_to_hash.merge({
                                                  'author' => author,
                                                  'label' => label,
                                                  'genre' => genre
                                                })
    @preserve_data.save('data/games.json', game_album_hash)
    puts "Game added successfully!\n"
  end
end
