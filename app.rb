require_relative 'classes/music_album'
require_relative 'classes/genre'

class App
  def initialize
    @musics=[]
    @genres=[]
  end

  def add_music_album
    puts 'Publication date'
    publish_date = gets.chomp
    print 'Is the Music album on spotify? [y/n]'
    on_spotify = (gets.chomp.to_s).downcase
    puts 'Out of range' if !['y', 'n'].include?(on_spotify)
    on_spotif = on_spotify === 'y'
    music = MusicAlbum.new(publish_date, on_spotify: on_spotif)
    @musics << music
    puts "Music album added successfully!"
  end
end
