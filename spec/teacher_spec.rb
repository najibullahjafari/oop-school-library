require_relative '../teacher'

describe Teacher do
  let(:teacher_name) { 'Sir. Ramadan' }
  let(:teacher_age) { 60 }
  let(:teacher_specialization) { 'Mathematics' }

  subject { described_class.new(teacher_name, teacher_age, teacher_specialization) }

  it 'should initialize with the correct attributes' do
    expect(subject.name).to eq(teacher_name)
    expect(subject.age).to eq(teacher_age)
    expect(subject.specialization).to eq(teacher_specialization)
  end
end
