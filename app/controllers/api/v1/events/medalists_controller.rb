class Api::V1::Events::MedalistsController < ApplicationController
  def show
    event = Event.find(params[:id])
    event_medalists = FormatEventMedalists.new(event)
    render json: event_medalists
  end
end
