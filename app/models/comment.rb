class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def display_author
    if self.user.nil?
      "[Deleted]"
    else
      self.user.username
    end
  end

end
