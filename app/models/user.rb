class User < ApplicationRecord
  has_many :events, foreign_key: :user_id
  has_many :created_events, through: :event_creating
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
end
