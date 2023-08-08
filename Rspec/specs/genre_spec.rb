require_relative '../../classes/genre'
require_relative '../../classes/item'

describe Genre do
    it 'should create a new genre' do
      genre = Genre.new('Hip-hop')

      expect(genre.name).to eq('Hip-hop')
      expect(genre).to be_instance_of(Genre)
    end

    it "should add an item to the genre's items array" do
      genre = Genre.new('Hip-hop')
      item = Item.new('2022-10-10')

      genre.add_item(item)

      expect(genre.items.length).to eq(1)
      expect(genre.items[0].publish_date).to eq('2022-10-10')
    end
end
