require_relative '../../classes/music_album'

describe MusicAlbum do
    it 'Create Music Album' do
      music_album = MusicAlbum.new('2023-03-03', on_spotify: true)

      expect(music_album.on_spotify).to eq(true)
      expect(music_album).to be_instance_of(MusicAlbum)
    end

    it 'should return "false" for archived' do
      music_album = MusicAlbum.new('2023-03-12', on_spotify: true)

      expect(music_album.archived).to eq(false)
    end
end
