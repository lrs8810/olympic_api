class Olympian < ApplicationRecord
  validates_presence_of :full_name,
                        :sex,
                        :age,
                        :height,
                        :weight

  belongs_to :team
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events

  def self.youngest
    where(age: minimum(:age))
  end

  def total_medals_won
    self.olympian_events.where.not(medal: 'NA').count
  end
end
