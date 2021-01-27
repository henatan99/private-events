class Event < ApplicationRecord
  has_many :event_creatings, foreign_key: :created_event_id
  has_many :attendees, through: :attended_event, source: :event_creator
  belongs_to :creator, class_name: 'User'
end
