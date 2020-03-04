require 'rails_helper'

RSpec.describe 'Events API' do
  it 'sends a list of events' do
    badminton = create(:sport, name: 'Badminton')
    create(:event, name: 'Badminton Men\'s Doubles', sport_id: badminton.id)
    create(:event, name: 'Badminton Men\'s Singles', sport_id: badminton.id)
    create(:event, name: 'Badminton Women\'s Double', sport_id: badminton.id)

    archery = create(:sport, name: 'Archery')
    create(:event, name: 'Archery Men\'s Individual', sport_id: archery.id)
    create(:event, name: 'Archery Men\'s Team', sport_id: archery.id)
    create(:event, name: 'Archery Women\'s Individual', sport_id: archery.id)

    get '/api/v1/events'

    expect(response).to be_successful

    events_res = JSON.parse(response.body, symbolize_names: true)

    expect(events_res).to have_key(:events)
    expect(events_res[:events]).to be_a(Array)
    expect(events_res[:events][0]).to be_a(Hash)
    expect(events_res[:events].count).to eq(2)
    expect(events_res[:events][0]).to have_key(:sport)
    expect(events_res[:events][0]).to have_key(:events)
    expect(events_res[:events][0][:sport]).to eq(archery.name)
    expect(events_res[:events][0][:events]).to be_a(Array)
    expect(events_res[:events][0][:events].count).to eq(3)
    expect(events_res[:events][1][:sport]).to eq(badminton.name)
    expect(events_res[:events][1][:events]).to be_a(Array)
    expect(events_res[:events][1][:events].count).to eq(3)
  end
end
