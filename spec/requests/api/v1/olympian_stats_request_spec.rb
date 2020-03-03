require 'rails_helper'

RSpec.describe 'Olympian Stats API' do
  before(:each) do
    create_list(:olympian, 3)
  end

  it 'sends a back the olympian statistics' do
    get '/api/v1/olympian_stats'

    expect(response).to be_successful

    stats_res = JSON.parse(response.body, symbolize_names: true)

    expect(stats_res).to have_key(:olympian_stats)
    expect(stats_res.count).to eq(1)
    expect(stats_res).to be_a(Hash)
    expect(stats_res[:olympian_stats]).to be_a(Hash)
    expect(stats_res[:olympian_stats]).to have_key(:total_competing_olympians)
    expect(stats_res[:olympian_stats]).to have_key(:average_weight)
    expect(stats_res[:olympian_stats]).to have_key(:average_age)
    expect(stats_res[:olympian_stats][:average_weight]).to be_a(Hash)
    expect(stats_res[:olympian_stats][:average_weight]).to have_key(:unit)
    expect(stats_res[:olympian_stats][:average_weight][:unite]).to eq('kg')
    expect(stats_res[:olympian_stats][:average_weight]).to have_key(:male_olympians)
    expect(stats_res[:olympian_stats][:average_weight]).to have_key(:female_olympians)
  end
end
