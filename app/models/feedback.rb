class Feedback < ApplicationRecord
  belongs_to :feedbackable, polymorphic: true
end
