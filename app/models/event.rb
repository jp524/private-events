class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: "event_id"
  has_many :attendees, through: :event_attendances
end
