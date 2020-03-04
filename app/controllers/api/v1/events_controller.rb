class Api::V1::EventsController < ApplicationController
  def index
    
    render json: events
  end
end
