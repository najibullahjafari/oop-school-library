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

    it 'Should test if a person can use services?' do
      person = Person.new('Najib', 22, parent_permission: true)
      expect(person.can_use_services?).to eq(true)
    end

    it 'Should test if a person can use services? under age of 18' do
      person = Person.new('Najib', 12, parent_permission: false)
      expect(person.can_use_services?).to eq(false)
    end

    it 'should test if the name of a person is trimmed?' do
      person = Person.new('Najib', 22, parent_permission: true)
      correctname = person.correct_name
      expect(correctname.length <= 10).to be true
    end

    it "should add a rental to a person's rentals list" do
      person = Person.new('Najib', 22, parent_permission: true)
      book = Book.new('Book Title', 'Author')
      date = Date.new(2023, 9, 30)
      person.add_rental(book, date)
      expect(person.rentals).to include(an_instance_of(Rental))
    end
  end
end
