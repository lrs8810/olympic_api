class FormatOlympian
  def initialize(olympian)
    @name = olympian.full_name
    @team = olympian.team.name
    @age = olympian.age
    @sport = olympian.sport.name
    @total_medals_won = olympian.total_medals_won
  end
end
