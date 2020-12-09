class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :event_type_id
    validates :user
    validates :date
    validates :start_at
    validates :finish_at
  end

  validate :event_date
  validate :event_intersection

  scope :chronologically, -> { order(date: :asc, start_at: :asc) }

  private

  def event_date
    errors.add(:past_date, 'cannot be in the past') unless date&.future?
  end

  def event_intersection
    return if Event.where(user_id: user_id, date: date).where.not(id: id).none?

    errors.add(:intersection, 'cannot intersects, another event this date')
  end
end
