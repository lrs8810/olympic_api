require 'rails_helper'

RSpec.describe OlympianEvent, type: :model do
  describe 'relationships' do
    it { should belong_to :olympian }
    it { should belong_to :event }
  end

  describe 'validations' do
    it { should validate_presence_of(:medal) }
  end

  describe 'associations' do
    before(:each) do
      @olympian_event = create(:olympian_event)
    end

    it 'belongs to an olympian' do
      expect(@olympian_event.olympian).to be_a(Olympian)
    end

    it 'belongs to an event' do
      expect(@olympian_event.event).to be_a(Event)
    end
  end
end
