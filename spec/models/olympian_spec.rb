require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'relationships' do
    it { should belong_to :team }
    it { should belong_to :sport }
    it { should have_many :olympian_events }
    it { should have_many(:events).through(:olympian_events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:sex) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:weight) }
  end

  describe 'associations' do
    before(:each) do
      @olympian = create(:olympian, :with_olympian_events, olympian_event_count: 3)
    end

    it 'has many olympian_events' do
      expect(@olympian.olympian_events.count).to eq(3)
    end

    it 'has many events' do
      expect(@olympian.events.count).to eq(3)
    end

    it 'belongs to a sport' do
      expect(@olympian.sport).to be_a(Sport)
    end

    it 'belongs to a team' do
      expect(@olympian.team).to be_a(Team)
    end
  end

  describe 'class methods' do
    it '.youngest' do
      olympian_1 = create(:olympian, :with_olympian_events, olympian_event_count: 3)
      create(:olympian, :with_olympian_events, olympian_event_count: 2)
      create(:olympian, :with_olympian_events, olympian_event_count: 1)

      expect(Olympian.youngest[0]).to eq(olympian_1)
    end
  end

  describe 'instance methods' do
    it 'total_medals_won' do
      olympian = create(:olympian, :with_olympian_events, olympian_event_count: 3)

      expect(olympian.total_medals_won).to eq(3)
    end
  end
end
