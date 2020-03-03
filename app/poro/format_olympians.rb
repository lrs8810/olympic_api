class FormatOlympians
  attr_reader :olympians

  def initialize(olympians)
    @olympians = olympians.map { |olympian| FormatOlympian.new(olympian) }
  end
end
