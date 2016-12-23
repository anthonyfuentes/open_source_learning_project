
class Curriculum < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :curriculums_resources
  has_many :resources, through: :curriculums_resources

  has_many :feedbacks, as: :feedbackable
  has_many :comments, as: :commentable

  belongs_to :creator, class_name: "User"

  has_many  :curriculums_users,
            dependent: :destroy

  has_many  :users, through: :curriculums_users

  validates :title, :subtitle, presence: true, length: { minimum: 4 }

  accepts_nested_attributes_for :curriculums_resources

  def creator_name
    creator.username if creator
  end

  def user
    creator
  end

end
Curriculum.import force: true
