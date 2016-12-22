
class Resource < ApplicationRecord
  
  enum media_types: [:video, :interactive, :reading]

  belongs_to :category, optional: true
  belongs_to :submitter, class_name: "User"

  has_many :curriculums_resources
  has_many :curriculums, through: :curriculums_resources

  has_many :feedbacks, as: :feedbackable

  has_many :links

  has_many :resources_tags
  has_many :tags, through: :resources_tags

  accepts_nested_attributes_for :links, reject_if: :all_blank


  searchable do
    integer :submitter_id, using: :submitter_id, references: User, multiple: false
    integer :category_id, using: :category_id, references: Category, multiple: false
    text :title
    text :subtitle
    text :description
    integer :media_type
    text :credits
  end

  def self.index_search(params)
    self.search do 
      fulltext params 
    end
  end
end
