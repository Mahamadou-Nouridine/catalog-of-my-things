require_relative '../../classes/label'

describe Label do
  describe '#initialize' do
    it 'sets id, title, color, and initializes items' do
      subject = Label.new('Test title', 'Green')
      expect(subject).to be_instance_of(Label)
      expect(subject.object_to_hash['items']).to eq([])
      expect(subject.object_to_hash['color']).to eq('Green')
    end
  end
end
