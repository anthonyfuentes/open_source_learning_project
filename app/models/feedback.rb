class Feedback < ApplicationRecord
  belongs_to :feedbackable, polymorphic: true
  validates :rating, presence: true
  validates :difficulty, presence: true
end
