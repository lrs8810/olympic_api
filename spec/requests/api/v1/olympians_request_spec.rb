require 'rails_helper'

RSpec.describe 'Olympians API' do
  before(:each) do
    create_list(:olympian, 3)
  end

  it 'sends a list of olympians' do
    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body, symbolize_names: true)

    expect(olympians.count).to eq(3)
    expect(olympians).to have_key("olympians")
  end
end
