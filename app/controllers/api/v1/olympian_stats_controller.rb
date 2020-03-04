class Api::V1::OlympianStatsController < ApplicationController
  def index
    olympian_stats = FormatOlympianStats.new(Olympian.all)
    render json: olympian_stats
  end
end
