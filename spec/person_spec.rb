require_relative '../person'

describe Person do
  context 'test person class' do
    it 'This test should return the exact data' do
      person = Person.new('Najib', 22)
      age = person.age
      name = person.name
      expect(age).to eq(22)
      expect(name).to eq('Najib')
    end
  end
end
