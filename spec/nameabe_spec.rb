require_relative '../nameable'

describe Nameable do
  subject { described_class.new }

  it 'should raise NotImplementedError for correct_name' do
    expect { subject.correct_name }.to raise_error(NotImplementedError, 'Subclasses must implement the correct_name method')
  end
end
