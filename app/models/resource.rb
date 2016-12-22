
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


  searchable do
    text :submitter do
      User.find(submitter_id).username
    end

    text :tags do 
      tags.map { |tag| tag.name }
    end

    join(:tag_id, :target => ResourcesTag, :type => :integer, :join => { :from => :resource_id, :to => :id })

    text :category do
      Category.find(category_id).name
    end
    integer :category_id
    text :title
    text :subtitle
    text :description
    integer :media_type
    text :credits
  end

  def self.index_search(params)
    self.search do 
      all_of do
        with(:category_id, params[:category_id]) unless params[:category_id] == ""
        with(:tag_id, params[:tag_id]) unless params[:tag_id] == ""
      end
      fulltext params[:q] if params[:q]
    end
  end

end
