require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'relationships' do
    it { should have_many :olympians }
    it { should have_many :events }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    before(:each) do
      @sport = create(:sport,
                      :with_olympians,
                      :with_events,
                      olympian_count: 3,
                      event_count: 3
                    )
    end

    it 'have many olympians' do
      expect(@sport.olympians[1]).to be_a(Olympian)
    end

    it 'have many events' do
      expect(@sport.events[0]).to be_a(Event)
    end
  end
end
