class Api::V1::OlympiansController < ApplicationController
  def index
    olympians = FormatOlympian.new(Olympian.all)
    render json: olympians
  end
end
