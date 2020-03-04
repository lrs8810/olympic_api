class Api::V1::OlympiansController < ApplicationController
  def index
    if request.query_string.empty?
      show_all_olympians
    elsif !age_params.empty? && check_params
      show_olympian_based_on_age
    else
      render json: error_message, status: 400
    end
  end

  private
    def show_all_olympians
      olympians = FormatOlympians.new(Olympian.all)
      render json: olympians
    end

    def show_olympian_based_on_age
      if params[:age] == 'youngest'
        olympians = FormatOlympians.new(Olympian.youngest)
      elsif params[:age] == 'oldest'
        olympians = FormatOlympians.new(Olympian.oldest)
      end
      render json: olympians
    end

    def check_params
      params[:age] == 'youngest' || params[:age] == 'oldest'
    end

    def age_params
      params.permit(:age)
    end

    def error_message
      { 'error': 'The request you made is invalid. Please pass `age=youngest` or `age=oldest` in the query parameters.' }
    end
end
