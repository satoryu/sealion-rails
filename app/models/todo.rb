class Todo < ApplicationRecord
  validates :content, presence: true

  scope :incomplete, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(incomplete.where_values_hash) }

  def completed?
    completed_at.present?
  end
end
