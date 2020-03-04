class FormatMedalist
  attr_reader :name, :team, :age, :medal

  def initialize(olympian, event_id)
    @name = olympian.full_name
    @team = olympian.team.name
    @age = olympian.age
    @medal = olympian.get_medal(event_id)
  end
end
