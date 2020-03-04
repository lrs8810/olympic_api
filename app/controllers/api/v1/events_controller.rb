class Api::V1::EventsController < ApplicationController
  def index
    events = FormatEventsResponse.new(Sport.all)
    render json: events
  end
end
