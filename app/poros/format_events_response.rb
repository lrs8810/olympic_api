class FormatEventsResponse
  attr_reader :events

  def initialize(sports)
    @events = sports.order_names.map { |sport| FormatSportEvents.new(sport) }
  end
end
