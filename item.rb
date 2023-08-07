class Item
  attr_accessor :publish_date, :archived, :label, :author, :genre, :source
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = rand(1..1_000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
