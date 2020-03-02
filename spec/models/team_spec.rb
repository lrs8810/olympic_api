require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :olympians }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    before(:each) do
      @team = create(:team,:with_olympians,olympian_count: 3)
    end

    it 'has many olympians' do
      expect(@team.olympians[1]).to be_a(Olympian)
    end
  end
end
