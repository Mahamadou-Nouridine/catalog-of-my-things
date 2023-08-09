require_relative 'author'
require_relative 'preserve_data'

class AddAuthor
  def initialize(file, item)
    puts '- Add an author'
    print 'First name: '
    @first = gets.chomp
    print 'Last name: '
    @last = gets.chomp
    author = Author.new(@first, @last)
    author.add_item({ 'id' => item.id, 'publish_date' => item.publish_date, 'multiplayer' => item.multiplayer,
                      'last_played' => item.last_played_at })
    data = PreserveData.new
    data.save(file,
              { 'id' => author.id, 'first_name' => author.first_name, 'last_name' => author.last_name,
                'item' => author.items })
  end
end
