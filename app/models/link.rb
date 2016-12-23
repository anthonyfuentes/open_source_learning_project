
class Link < ApplicationRecord
  validates :url, presence: true, :format => { :with => /http/ }
  belongs_to :resource, inverse_of: :links

end
