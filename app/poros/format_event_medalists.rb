class FormatEventMedalists
  attr_reader :event, :medalists

  def initialize(event)
    @event = event.name
    @medalists = event.olympians.with_medals.map { |olympian| FormatMedalist.new(olympian, event.id) }
  end
end
