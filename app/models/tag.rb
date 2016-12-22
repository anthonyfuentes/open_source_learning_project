class Tag < ApplicationRecord
  has_many :resources_tags
  has_many :resources, 
           through: :resources_tags
  searchable do

  end

  searchable do
    text :name
  end
end
