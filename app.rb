require_relative 'classes/music_album'
require_relative 'classes/genre'

class App
  def initialize
    @musics=[]
    @genres=[]
  end

  def add_music
    puts 'Publication date'
    publish_date = gets.chomp
    print 'Is the Music on spotify? [y/n]'
    on_spotify = (gets.chomp.to_s).downcase
    puts 'Out of range' if !on_spotify.in?(['y', 'n'])
    on_spotif = on_spotify === 'y'
    music = MusicAlbum.new(publish_date, on_spotif)
    @musics << music
  end
end
