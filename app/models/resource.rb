class Resource < ApplicationRecord
  has_many :resources_tags
  has_many :tags, through: :resources_tags

  belongs_to :category

  has_many :links

  belongs_to :submitter, class_name: "User"
  has_many :feedbacks, as: :feedbackable

  has_many :curriculums_resources
  has_many :curriculums, through: :curriculums_resources
end
