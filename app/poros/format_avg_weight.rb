class FormatAvgWeight
  def initialize(olympians)
    @unit = 'kg'
    @male_olympians = round_weight(olympians.male_avg_weight)
    @female_olympians = round_weight(olympians.female_avg_weight)
  end

  def round_weight(avg_weight)
    avg_weight.round(1)
  end
end
