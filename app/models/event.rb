class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: "event_id"
  has_many :attendees, through: :event_attendances

  scope :past, -> { where(date: (..Time.now)) }
  scope :future, -> { where(date: (Time.now..)) }

  # def self.past
  #   Event.where(date: (..Time.now))
  # end

  # def self.future
  #   Event.where(date: (Time.now..))
  # end
end
