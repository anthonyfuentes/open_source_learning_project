
class Curriculum < ApplicationRecord
  has_many :curriculum_resources
  has_many :resources, through: :curriculum_resources

  has_many :feedbacks, as: :feedbackable

  belongs_to :creator, class_name: "User"

  validates :title, :subtitle, presence: true, length: { minimum: 4 }
end
