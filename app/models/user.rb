class User < ApplicationRecord
  has_many :created_events,
           foreign_key: :creator_id,
           class_name: 'Event',
           dependent: :destroy,
           inverse_of: 'creator'
  has_many :attendances, foreign_key: :attendee_id, dependent: :destroy, inverse_of: 'attendee'
  has_many :attended_events, through: :attendances, source: :event    

  validates :name, presence: true, uniqueness: true

end
