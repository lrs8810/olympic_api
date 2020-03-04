class Sport < ApplicationRecord
  validates_presence_of :name

  has_many :olympians
  has_many :events

  def self.order_names
    order(:name)
  end
end
