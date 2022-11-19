class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: "event_id"
  has_many :attendees, through: :event_attendances

  scope :past, -> { where(date: (..Time.now)) }
  scope :future, -> { where(date: (Time.now..)) }

  validates :name, presence: true
  validate :event_cannot_be_in_the_past
  validates :location, presence: true

  def event_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date <= Time.now
  end

  # def self.past
  #   Event.where(date: (..Time.now))
  # end

  # def self.future
  #   Event.where(date: (Time.now..))
  # end
end
