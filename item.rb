require 'date'

class Item
  attr_accessor :publish_date, :archived, :label, :author, :genre, :source
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = rand(1..1_000)
    @publish_date = publish_date
    @archived = archived
  end
  
  def add_source(source)
    @source = source
  end

  def can_be_archived?
    (Time.now.year - @published_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
