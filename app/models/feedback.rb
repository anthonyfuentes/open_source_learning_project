
class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :feedbackable, polymorphic: true

  validates :rating, presence: true
  validates :difficulty, presence: true

  validates :user_id, uniqueness: { scope: [:feedbackable_type, :feedbackable_id] }
end
