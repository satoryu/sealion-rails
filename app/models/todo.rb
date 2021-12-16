class Todo < ApplicationRecord
  validates :content, presence: true

  scope :completed, -> { where.not(completed_at: nil) }
end
