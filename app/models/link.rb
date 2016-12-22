
class Link < ApplicationRecord
  belongs_to :resource, inverse_of: :links
end
