
class Curriculum < ApplicationRecord
  has_many :curriculums_resources
  has_many :resources, through: :curriculums_resources

  has_many :feedbacks, as: :feedbackable

  belongs_to :creator, class_name: "User"

  validates :title, :subtitle, presence: true, length: { minimum: 4 }

  def creator_name
    creator.username
  end
end
