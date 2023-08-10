require_relative '../../classes/item'
require_relative '../../classes/genre'
require_relative '../../classes/author'
require_relative '../../classes/label'

describe Item do
  let(:item) { Item.new('2022-12-12') }
  let(:genre) { Genre.new('hiphop') }
  let(:label) { Label.new('production', 'red') }
  let(:author) { Author.new('Micheal', 'Jackson') }
  it 'The item should be an instance Item class' do
    expect(item).to be_instance_of(Item)
  end

  it 'Should add a genre to given item' do
    item.add_genre(genre)
    expect(item.genre).to eq(genre)
    expect(genre.items).to include(item)
  end

  it 'Should add an author to given item' do
    item.add_author(author)
    expect(item.author).to eq(author)
    expect(author.items).to include(item)
  end

  it 'Should add a label to given item' do
    item.add_label(label)
    expect(item.label).to eq(label)
    expect(label.items).to include(item)
  end

  it 'Item archived method' do
    expect(item.can_be_archived?).to eq(false)
  end

  it "This Item can't be archived" do
    item.move_to_archive
    expect(item.archived).to eq(false)
  end
end
