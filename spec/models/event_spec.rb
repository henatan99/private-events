require './rails_helper'

RSpec.describe Event, type: :model do
  context 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  subject do
    Event.new(name: 'Anything',
              description: 'Lorem ipsum',
              date: DateTime.now + 1.week,
              creator_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a date' do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a crator id' do
    subject.creator_id = nil
    expect(subject).to_not be_valid
  end
end
