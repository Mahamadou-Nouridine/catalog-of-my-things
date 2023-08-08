require_relative 'app'

OPTIONS = {
  '1' => 'add_music_album',
  '2' => 'List all Music albums',
  '3' => 'List all genres',
  '4' => 'List All Authors',
  '5' => 'List All Games',
  '10' => 'Quit'
}.freeze

def main
  app = App.new
  puts "Welcom to Catalog of my things applpication\n\n"
  loop do
    puts 'Select an option to continue'
    OPTIONS.each { |index, string| puts "#{index} - #{string}" }
    user_option = gets.chomp.to_s
    case user_option
    when '1'
      app.add_music_album
    when '2'
      app.list_music_albums
    when '3'
      app.list_genres
    when '4'
      app.list_authors
    when '5'
      app.list_games
    when '10'
      puts 'Bye bye, see you again!'
      exit
    else
      puts 'Invalid option, please select again a number between 1 and 10'
    end
  end
end

main
