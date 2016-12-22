class Comment < ApplicationRecord
  belongs_to :feedbackable, polymorphic: true
end
