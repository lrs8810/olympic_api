class Event < ApplicationRecord
  validates_presence_of :name

  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  def self.event_name
    pluck(:name)
  end
end
