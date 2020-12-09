class EventType < ApplicationRecord
  has_many :events, dependent: :restrict_with_error

  validates :title, presence: true, uniqueness: { case_sensitive: false }

  scope :evrone_special, -> { where(title: ['Внутренний митап', 'Прогон доклада']) }
end
