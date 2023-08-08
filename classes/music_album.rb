require_relative 'item'

class MusicAlbum < Item
  def initialize(publish_date, on_spotify: false, archived: false)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def object_to_hash
    {
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify,
      'archived' => @archived
    }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
