class FormatOlympianStats
  attr_reader :olympian_stats

  def initialize(olympians)
    @olympian_stats = FormatTotalAvg.new(olympians)
  end
end
