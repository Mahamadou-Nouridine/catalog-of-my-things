require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify: false, archived: false)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def object_to_hash
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify,
      'archived' => @archived,
      # 'author' => @author.object_to_hash,
      # 'label' => @label.object_to_hash,
      # 'genre' => @genre.object_to_hash,
    }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
