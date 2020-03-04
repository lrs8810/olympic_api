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

  def self.oldest
    where(age: maximum(:age))
  end

  def self.total_competing
    count(:id)
  end

  def self.average_age
    average(:age)
  end

  def self.male_avg_weight
    where(sex: 'M').average(:weight)
  end

  def self.female_avg_weight
    where(sex: 'F').average(:weight)
  end

  def self.with_medals
    where('olympian_events.medal != ?', 'NA')
  end

  def get_medal(event_id)
    olympian_events.where(event_id: event_id).first.medal
  end

  def total_medals_won
    self.olympian_events.where.not(medal: 'NA').count
  end
end
