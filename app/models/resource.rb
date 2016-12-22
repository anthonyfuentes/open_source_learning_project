
class Resource < ApplicationRecord
  validates :title, presence: true

  enum media_types: [:video, :interactive, :reading]

  belongs_to :category, optional: true
  belongs_to :submitter, class_name: "User"

  has_many :curriculums_resources
  has_many :curriculums, through: :curriculums_resources

  has_many :feedbacks, as: :feedbackable

  has_many :links, inverse_of: :resource, dependent: :destroy

  has_many :resources_tags
  has_many :tags, through: :resources_tags

  accepts_nested_attributes_for :links, reject_if: :all_blank

  def url
    links.first.url unless links.empty?
  end
end
