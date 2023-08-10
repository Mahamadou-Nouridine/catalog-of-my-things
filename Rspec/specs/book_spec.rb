require_relative '../../classes/book'
require_relative '../../classes/item'

describe Book do
  let(:publish_date) { Date.new(2020, 1, 1) }
  let(:publisher) { 'Example Publisher' }
  let(:cover_state) { 'good' }
  let(:book) { Book.new(publish_date, publisher, cover_state) }

  describe '#initialize' do
    it 'creates a Book instance' do
      expect(book).to be_instance_of(Book)
    end

    it 'sets the publisher' do
      expect(book.publisher).to eq(publisher)
    end

    it 'sets the cover state' do
      expect(book.cover_state).to eq(cover_state)
    end

    it 'inherits from Item' do
      expect(book).to be_a(Item)
    end
  end

  describe '#object_to_hash' do
    it 'returns a hash with book attributes' do
      expected_hash = {
        'publish_date' => publish_date,
        'publisher' => publisher,
        'cover_state' => cover_state
      }
      expect(book.object_to_hash).to eq(expected_hash)
    end
  end

  describe '#can_be_archived?' do
  context 'when cover state is bad' do
    let(:cover_state) { 'bad' }

    it 'returns true' do
      expect(book.can_be_archived?).to be true
    end
  end

  context 'when cover state is not bad' do
    it 'returns false' do
      expect(book.can_be_archived?).to be false
    end
  end
end
