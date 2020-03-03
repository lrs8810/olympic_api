class FormatOlympian
  attr_reader :olympians

  def initialize(olympians)
    olympian_array = []

    olympians.each do |olympian|
      olympian_hash = {
        "name" => olympian.full_name,
        "team" => olympian.team.name,
        "age" => olympian.age,
        "sport" => olympian.sport.name,
        "total_medals_won" => olympian.total_medals_won
      }

      olympian_array << olympian_hash
    end

    @olympians = olympian_array
  end
end
