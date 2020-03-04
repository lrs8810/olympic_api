class FormatSportEvents
  def initialize(sport)
    @sport = sport.name
    @events = sport.events.event_name(sport.id)
  end
end
