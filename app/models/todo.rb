class Todo < ApplicationRecord
  validates :content, presence: true

  scope :incomplete, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  def completed?
    completed_at.present?
  end
end
