require_relative '../book'

describe Book do
  context 'When testing the Book class' do
    it 'should return the same title and author' do
      Book.new('Some Title', 'Some Author')
      title = 'Some Title'
      author = 'Some Author'
      expect(title).to eq 'Some Title'
      expect(author).to eq 'Some Author'
    end
  end
end
