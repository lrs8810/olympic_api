require 'rails_helper'

RSpec.describe 'Events API' do
  before(:each) do
    @badminton = create(:sport, name: 'Badminton')
    @badminton_doubles = create(:event,
                                name: 'Badminton Men\'s Doubles',
                                sport_id: @badminton.id)
    create(:event, name: 'Badminton Men\'s Singles', sport_id: @badminton.id)
    create(:event, name: 'Badminton Women\'s Double', sport_id: @badminton.id)

    @archery = create(:sport, name: 'Archery')
    create(:event, name: 'Archery Men\'s Individual', sport_id: @archery.id)
    create(:event, name: 'Archery Men\'s Team', sport_id: @archery.id)
    create(:event, name: 'Archery Women\'s Individual', sport_id: @archery.id)
  end

  it 'sends a list of events' do
    get '/api/v1/events'

    expect(response).to be_successful

    events_res = JSON.parse(response.body, symbolize_names: true)

    expect(events_res).to have_key(:events)
    expect(events_res[:events]).to be_a(Array)
    expect(events_res[:events][0]).to be_a(Hash)
    expect(events_res[:events].count).to eq(2)
    expect(events_res[:events][0]).to have_key(:sport)
    expect(events_res[:events][0]).to have_key(:events)
    expect(events_res[:events][0][:sport]).to eq(@archery.name)
    expect(events_res[:events][0][:events]).to be_a(Array)
    expect(events_res[:events][0][:events].count).to eq(3)
    expect(events_res[:events][1][:sport]).to eq(@badminton.name)
    expect(events_res[:events][1][:events]).to be_a(Array)
    expect(events_res[:events][1][:events].count).to eq(3)
  end

  it 'sends medalists for a specific event' do
    olympian_1 = create(:olympian, full_name: 'Greg')
    olympian_2 = create(:olympian, full_name: 'Sam')
    olympian_3 = create(:olympian, full_name: 'Fred')

    olympian_event_1 = create(:olympian_event,
                              event_id: @badminton_doubles.id,
                              olympian_id: olympian_1.id,
                              medal: 'Bronze')
    olympian_event_2 = create(:olympian_event,
                              event_id: @badminton_doubles.id,
                              olympian_id: olympian_2.id,
                              medal: 'Gold')
    olympian_event_3 = create(:olympian_event,
                              event_id: @badminton_doubles.id,
                              olympian_id: olympian_3.id,
                              medal: 'NA')

    get "/api/v1/events/#{@badminton_doubles.id}/medalists"

    expect(response).to be_successful

    events_res = JSON.parse(response.body, symbolize_names: true)

    expect(events_res).to be_a(Hash)
    expect(events_res).to have_key(:event)
    expect(events_res[:event]).to eq(@badminton_doubles.name)
    expect(events_res).to have_key(:medalists)
    expect(events_res[:medalists]).to be_a(Array)
    expect(events_res[:medalists].count).to eq(2)
    expect(events_res[:medalists][0]).to have_key(:name)
    expect(events_res[:medalists][0][:name]).to eq(olympian_1.full_name)
    expect(events_res[:medalists][0]).to have_key(:team)
    expect(events_res[:medalists][0][:team]).to eq(olympian_1.team.name)
    expect(events_res[:medalists][0]).to have_key(:age)
    expect(events_res[:medalists][0][:age]).to eq(olympian_1.age)
    expect(events_res[:medalists][0]).to have_key(:medal)
    expect(events_res[:medalists][0][:medal]).to eq(olympian_event_1.medal)
    expect(events_res[:medalists][1][:name]).to_not eq(olympian_3.full_name)
    expect(events_res[:medalists][1][:medal]).to_not eq(olympian_event_3.medal)
    expect(events_res[:medalists][1][:name]).to eq(olympian_2.full_name)
    expect(events_res[:medalists][1][:medal]).to eq(olympian_event_2.medal)
  end
end
