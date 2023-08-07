require 'date'

class Item
  attr_accessor :publish_date, :archived, :label, :author, :genre, :source
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = rand(1..1_000)
    @publish_date = publish_date
    @archived = archived
  end
end
