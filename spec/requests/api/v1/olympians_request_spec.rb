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

    youngest_res = JSON.parse(response.body, symbolize_names: true)

    youngest_olympian = FormatOlympian.new(Olympian.first)

    expect(youngest_res).to have_key(:olympians)
    expect(youngest_res[:olympians].count).to eq(1)
    expect(youngest_res[:olympians]).to be_a(Array)
    expect(youngest_res[:olympians][0]).to be_a(Hash)
    expect(youngest_res[:olympians][0]).to have_key(:name)
    expect(youngest_res[:olympians][0]).to have_key(:team)
    expect(youngest_res[:olympians][0]).to have_key(:age)
    expect(youngest_res[:olympians][0]).to have_key(:sport)
    expect(youngest_res[:olympians][0]).to have_key(:total_medals_won)
    expect(youngest_res[:olympians][0][:name]).to eq(youngest_olympian.name)
    expect(youngest_res[:olympians][0][:team]).to eq(youngest_olympian.team)
    expect(youngest_res[:olympians][0][:age]).to eq(youngest_olympian.age)
    expect(youngest_res[:olympians][0][:sport]).to eq(youngest_olympian.sport)
    expect(youngest_res[:olympians][0][:total_medals_won]).to eq(youngest_olympian.total_medals_won)
  end

  it 'sends a back the oldest olympian' do
    get '/api/v1/olympians?age=oldest'

    expect(response).to be_successful

    oldest_res = JSON.parse(response.body, symbolize_names: true)

    oldest_olympian = FormatOlympian.new(Olympian.last)

    expect(oldest_res).to have_key(:olympians)
    expect(oldest_res[:olympians].count).to eq(1)
    expect(oldest_res[:olympians]).to be_a(Array)
    expect(oldest_res[:olympians][0]).to be_a(Hash)
    expect(oldest_res[:olympians][0]).to have_key(:name)
    expect(oldest_res[:olympians][0]).to have_key(:team)
    expect(oldest_res[:olympians][0]).to have_key(:age)
    expect(oldest_res[:olympians][0]).to have_key(:sport)
    expect(oldest_res[:olympians][0]).to have_key(:total_medals_won)
    expect(oldest_res[:olympians][0][:name]).to eq(oldest_olympian.name)
    expect(oldest_res[:olympians][0][:team]).to eq(oldest_olympian.team)
    expect(oldest_res[:olympians][0][:age]).to eq(oldest_olympian.age)
    expect(oldest_res[:olympians][0][:sport]).to eq(oldest_olympian.sport)
    expect(oldest_res[:olympians][0][:total_medals_won]).to eq(oldest_olympian.total_medals_won)
  end
end
