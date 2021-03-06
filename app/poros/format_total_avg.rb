class FormatTotalAvg
  def initialize(olympians)
    @total_competing_olympians = olympians.total_competing
    @average_weight = FormatAvgWeight.new(olympians)
    @average_age = (olympians.average_age).to_f.round(1)
  end
end
