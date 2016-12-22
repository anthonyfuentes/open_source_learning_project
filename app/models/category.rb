class Category < ApplicationRecord
  has_many :resources

  searchable do
    text :name
  end

end
