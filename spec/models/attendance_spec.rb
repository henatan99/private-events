require "./rails_helper"

RSpec.describe Event, :type => :model do
    context 'associations' do
        it { should belong_to(:event).class_name('Event') }
        it { should belong_to(:attendee).class_name('User') }
    end      
     
end