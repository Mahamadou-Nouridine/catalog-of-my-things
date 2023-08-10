require_relative '../../classes/item'

describe Item do
  let (:item) {Item.new("2022-12-12")}
  it 'The item should be an instance Item class' do
    expect(item).to be_instance_of(Item)
  end
end
