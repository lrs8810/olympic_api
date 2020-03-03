class Api::V1::OlympiansController < ApplicationController
  def index
    olympians = check_params(params)
    render json: olympians
  end

  private
    def check_params(params)
      if request.query_string.empty?
        olympians = FormatOlympians.new(Olympian.all)
      elsif params[:age] == 'youngest'
        olympians = FormatOlympians.new(Olympian.youngest)
      elsif params[:age] == 'oldest'
        olympians = FormatOlympians.new(Olympian.oldest)
      end
    end
end
