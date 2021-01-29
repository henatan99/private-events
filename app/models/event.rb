class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee
  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end

def event_creator_name
  creator.name
end

def date_and_time
  date.strftime('%b %-d %Y %l:%M%P')
end

def date_only
  date.strftime('%b %-d %Y')
end

private

def starts_in_the_future
  return if date < Date.today

  errors[:date] << 'Event date must be in the future.'
end
