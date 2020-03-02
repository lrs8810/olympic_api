require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'relationships' do
    it { should belong_to :sport }
    it { should have_many :olympian_events }
    it { should have_many(:olympians).through(:olympian_events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    before(:each) do
      @event = create(:event, :with_olympian_events, olympian_event_count: 3)
    end

    it 'belongs to an sport' do
      expect(@event.sport).to be_a(Sport)
    end

    it 'has many olympian_events' do
      expect(@event.olympian_events.count).to eq(3)
    end

    it 'it has many olympians' do
      expect(@event.olympians.count).to eq(3)
    end

  end
end
