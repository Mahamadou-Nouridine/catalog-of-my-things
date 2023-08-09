require_relative 'author'
require_relative 'label'
require_relative 'genre'

module GetMetadata
  def get_author
    puts "The Author?"
    print "First name: "
    first_name = gets.chomp.to_s
    print "last name: "
    last_name = gets.chomp.to_s
    return Author.new(first_name, last_name)
  end

  def get_label
    puts "The Label?"
    print "title: "
    title = gets.chomp.to_s
    print "color: "
    color = gets.chomp.to_s
    return Label.new(title, color)
  end
end
