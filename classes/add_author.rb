require_relative 'author'
require_relative 'preserve_data'

class AddAuthor
  def initialize(file, item)
    puts 'The Author?'
    print 'First name: '
    first_name = gets.chomp.to_s
    print 'last name: '
    last_name = gets.chomp.to_s

    author = Author.new(first_name, last_name)
    author.add_item(item)

    data = PreserveData.new
    data.save(file, author.object_to_hash)
    author.object_to_hash
  end
end
