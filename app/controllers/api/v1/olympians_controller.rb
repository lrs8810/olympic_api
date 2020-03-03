class Api::V1::OlympiansController < ApplicationController
  def index
    olympians = check_params(params)
    render json: olympians
  end

  private
    def check_params(params)
      if request.query_string.empty?
        FormatOlympians.new(Olympian.all)
      elsif params[:age] == 'youngest'
        FormatOlympians.new(Olympian.youngest)
      elsif params[:age] == 'oldest'
        FormatOlympians.new(Olympian.oldest)
      end
    end
end
