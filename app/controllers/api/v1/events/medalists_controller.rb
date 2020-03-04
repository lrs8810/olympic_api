class Api::V1::Events::MedalistsController < ApplicationController
  def show
    event = Event.find_by(id: params[:id])
    if event.nil?
      render json: error_message, status: 404
    else
      event_medalists = FormatEventMedalists.new(event)
      render json: event_medalists
    end
  end

  private
    def error_message
      { 'error': "Event with id #{params[:id]} was not found. Please input a valid event id between 1-305." }
    end
end
