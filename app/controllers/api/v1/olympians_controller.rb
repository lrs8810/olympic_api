class Api::V1::OlympiansController < ApplicationController
  def index
    if params[:age]
      olympians = FormatOlympians.new(Olympian.youngest)
    else
      olympians = FormatOlympians.new(Olympian.all)
    end
    render json: olympians
  end
end
