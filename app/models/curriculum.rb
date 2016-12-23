
class Curriculum < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :curriculums_resources
  has_many :resources, through: :curriculums_resources

  has_many :feedbacks, as: :feedbackable
  has_many :comments, as: :commentable

  belongs_to :creator, class_name: "User"

  validates :title, :subtitle, presence: true, length: { minimum: 4 }

  def creator_name
    creator.username
  end

  def category_name
    resources.first.category.name unless resources.empty?
  end

end
Curriculum.import force: true
