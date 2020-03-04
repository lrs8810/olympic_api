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
    it 'youngest' do
      youngest_olympian = create(:olympian, age: 25)
      create(:olympian, age: 46)
      create(:olympian, age: 32)

      expect(Olympian.youngest[0]).to eq(youngest_olympian)
    end

    it 'oldest' do
      create(:olympian, age: 25)
      oldest_olympian = create(:olympian, age: 46)
      create(:olympian, age: 32)

      expect(Olympian.oldest[0]).to eq(oldest_olympian)
    end

    it 'total_competing' do
      create(:olympian, age: 30, weight: 50, sex: 'F')
      create(:olympian, age: 23, weight: 65, sex: 'M')
      create(:olympian, age: 25, weight: 75, sex: 'F')
      create(:olympian, age: 40, weight: 80, sex: 'F')
      create(:olympian, age: 35, weight: 100, sex: 'M')
      create(:olympian, age: 19, weight: 165, sex: 'M')

      expect(Olympian.total_competing).to eq(6)
    end

    it 'average_age' do
      create(:olympian, age: 30, weight: 50, sex: 'F')
      create(:olympian, age: 23, weight: 65, sex: 'M')
      create(:olympian, age: 25, weight: 75, sex: 'F')
      create(:olympian, age: 40, weight: 80, sex: 'F')
      create(:olympian, age: 35, weight: 100, sex: 'M')
      create(:olympian, age: 19, weight: 165, sex: 'M')

      expect(Olympian.average_age.round(1)).to eq(28.7)
    end

    it 'male_avg_weight' do
      create(:olympian, age: 30, weight: 50, sex: 'F')
      create(:olympian, age: 23, weight: 65, sex: 'M')
      create(:olympian, age: 25, weight: 75, sex: 'F')
      create(:olympian, age: 40, weight: 80, sex: 'F')
      create(:olympian, age: 35, weight: 100, sex: 'M')
      create(:olympian, age: 19, weight: 165, sex: 'M')

      expect(Olympian.male_avg_weight.round(1)).to eq(110)
    end

    it 'female_avg_weight' do
      create(:olympian, age: 30, weight: 50, sex: 'F')
      create(:olympian, age: 23, weight: 65, sex: 'M')
      create(:olympian, age: 25, weight: 75, sex: 'F')
      create(:olympian, age: 40, weight: 80, sex: 'F')
      create(:olympian, age: 35, weight: 100, sex: 'M')
      create(:olympian, age: 19, weight: 165, sex: 'M')

      expect(Olympian.female_avg_weight.round(1)).to eq(68.3)
    end
  end

  describe 'instance methods' do
    it 'total_medals_won' do
      olympian = create(:olympian, :with_olympian_events, olympian_event_count: 3)

      expect(olympian.total_medals_won).to eq(3)
    end
  end
end
