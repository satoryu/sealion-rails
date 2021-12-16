class Todo < ApplicationRecord
  validates :content, presence: true

  scope :incomplete, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }
end
