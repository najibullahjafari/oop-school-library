require_relative '../classroom'

describe Classroom do
  let(:classroom_label) { 'Microverse' }
  let(:student) { double('Student') }

  subject { described_class.new(classroom_label) }

  it 'should initialize with the correct label' do
    expect(subject.label).to eq(classroom_label)
  end

  it 'should start with an empty list of students' do
    expect(subject.students).to be_empty
  end
end
