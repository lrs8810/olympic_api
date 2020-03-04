require 'rails_helper'

RSpec.describe 'Events API' do
  it 'sends a list of events' do
    create_list(:event, 5)

    get '/api/v1/events'

    expect(response).to be_successful

    events_res = JSON.parse(response.body, symbolize_names: true)

    expect(events_res).to have_key(:events)
    expect(events_res[:events]).to be_a(Array)
    expect(events_res[:events][0]).to be_a(Hash)
  end
end
