require_relative 'author'
require_relative 'label'
require_relative 'genre'

module GetMetadata
  def get_author(music)
    puts 'The Author?'
    print 'First name: '
    first_name = gets.chomp.to_s
    print 'last name: '
    last_name = gets.chomp.to_s
    author = Author.new(first_name, last_name)
    music.add_author(author)
    author.object_to_hash
  end

  def get_label(music)
    puts 'The Label?'
    print 'Title: '
    title = gets.chomp.to_s
    print 'Color: '
    color = gets.chomp.to_s
    label = Label.new(title, color)
    music.add_label(label)
    label.object_to_hash
  end

  def get_genre(music)
    puts 'The genre?'
    print 'Name: '
    name = gets.chomp.to_s
    genre = Genre.new(name)
    music.add_genre(genre)
    genre.object_to_hash
  end
end
