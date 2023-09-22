require_relative '../nameable'

describe Nameable do
  subject { described_class.new }

  it 'should raise NotImplementedError for correct_name' do
    expect do
      subject.correct_name
    end.to raise_error(NotImplementedError, 'Subclasses must implement the correct_name method')
  end
end
