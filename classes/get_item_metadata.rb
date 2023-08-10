require_relative 'author'
require_relative 'label'
require_relative 'genre'
require_relative 'add_author'

module GetMetadata
  def get_author(file, item)
    puts 'The Author?'
    print 'First name: '
    first_name = gets.chomp.to_s
    print 'last name: '
    last_name = gets.chomp.to_s

    author = Author.new(first_name, last_name)
    item.add_author(author)
    data = PreserveData.new
    data.save(file, author.object_to_hash)
    author.necessary_info
  end

  def get_label(file, item)
    puts 'The Label?'
    print 'Title: '
    title = gets.chomp.to_s
    print 'Color: '
    color = gets.chomp.to_s
    label = Label.new(title, color)
    item.add_label(label)
    data = PreserveData.new
    data.save(file, label.object_to_hash)
    label.necessary_info
  end

  def get_genre(file, item)
    puts 'The genre?'
    print 'Name: '
    name = gets.chomp.to_s
    genre = Genre.new(name)
    item.add_genre(genre)
    data = PreserveData.new
    data.save(file, genre.object_to_hash)
    genre.necessary_info
  end
end
