
class Link < ApplicationRecord
  validates :url, presence: true
  belongs_to :resource, inverse_of: :links
end
