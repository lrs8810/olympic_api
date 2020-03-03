require 'rails_helper'

RSpec.describe 'Olympians API' do
  before(:each) do
    create_list(:olympian, 3)
  end

  it 'sends a list of olympians' do
    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body, symbolize_names: true)

    expect(olympians).to have_key(:olympians)
    expect(olympians[:olympians].count).to eq(3)
    expect(olympians[:olympians]).to be_a(Array)
    expect(olympians[:olympians][0]).to be_a(Hash)
    expect(olympians[:olympians][0]).to have_key(:name)
    expect(olympians[:olympians][0]).to have_key(:team)
    expect(olympians[:olympians][0]).to have_key(:age)
    expect(olympians[:olympians][0]).to have_key(:sport)
    expect(olympians[:olympians][0]).to have_key(:total_medals_won)
    expect(olympians[:olympians][0][:total_medals_won]).to be(0)
  end

  it 'sends a back the youngest olympian' do
    get '/api/v1/olympians?age=youngest'

    expect(response).to be_successful

    youngest_olympian = JSON.parse(response.body, symbolize_names: true)

    expect(youngest_olympian).to have_key(:olympians)
    expect(youngest_olympian[:olympians].count).to eq(1)
    expect(youngest_olympian[:olympians]).to be_a(Array)
    expect(youngest_olympian[:olympians][0]).to be_a(Hash)
    expect(youngest_olympian[:olympians][0]).to have_key(:name)
    expect(youngest_olympian[:olympians][0]).to have_key(:team)
    expect(youngest_olympian[:olympians][0]).to have_key(:age)
    expect(youngest_olympian[:olympians][0]).to have_key(:sport)
    expect(youngest_olympian[:olympians][0]).to have_key(:total_medals_won)
  end
end
