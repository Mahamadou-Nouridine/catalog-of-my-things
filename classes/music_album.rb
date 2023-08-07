require_relative 'item'

class MusicAlbum < Item
  def initialize(publish_date, on_spotify: false, archived: false)
    super(publish_date, archived: false)
    @on_spotify: on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
