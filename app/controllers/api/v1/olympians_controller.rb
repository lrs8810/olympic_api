class Api::V1::OlympiansController < ApplicationController
  def index
    olympians = FormatOlympians.new(Olympian.all)
    render json: olympians
  end
end
