require_relative '../student'

describe Student do
  let(:classroom) { double('Classroom', students: []) }
  context 'test student class' do
    it 'this will test to output of student class! ' do
      s = Student.new('Najib', 22, classroom)
      name = s.name
      age = s.age
      classroom = s.classroom
      expect(name).to eq('Najib')
      expect(age).to eq(22)
      expect(classroom).to eq(classroom)
    end
  end
end
