require 'rails_helper'

RSpec.describe 'Olympian Stats API' do
  it 'sends a back the olympian statistics' do
    create(:olympian, age: 30, weight: 50, sex: 'F')
    create(:olympian, age: 23, weight: 65, sex: 'M')
    create(:olympian, age: 25, weight: 75, sex: 'F')
    create(:olympian, age: 40, weight: 80, sex: 'F')
    create(:olympian, age: 35, weight: 100, sex: 'M')
    create(:olympian, age: 19, weight: 165, sex: 'M')

    get '/api/v1/olympian_stats'

    expect(response).to be_successful

    stats_res = JSON.parse(response.body, symbolize_names: true)

    expect(stats_res).to have_key(:olympian_stats)
    expect(stats_res.count).to eq(1)
    expect(stats_res).to be_a(Hash)
    expect(stats_res[:olympian_stats]).to be_a(Hash)
    expect(stats_res[:olympian_stats]).to have_key(:total_competing_olympians)
    expect(stats_res[:olympian_stats][:total_competing_olympians]).to be_a(Integer)
    expect(stats_res[:olympian_stats]).to have_key(:average_weight)
    expect(stats_res[:olympian_stats]).to have_key(:average_age)
    expect(stats_res[:olympian_stats][:average_age]).to be_a(Float)
    expect(stats_res[:olympian_stats][:average_weight]).to be_a(Hash)
    expect(stats_res[:olympian_stats][:average_weight]).to have_key(:unit)
    expect(stats_res[:olympian_stats][:average_weight][:unit]).to eq('kg')
    expect(stats_res[:olympian_stats][:average_weight]).to have_key(:male_olympians)
    expect(stats_res[:olympian_stats][:average_weight][:male_olympians]).to be_a(Float)
    expect(stats_res[:olympian_stats][:average_weight]).to have_key(:female_olympians)
    expect(stats_res[:olympian_stats][:average_weight][:female_olympians]).to be_a(Float)
  end
end
