class CurriculumsUser < ApplicationRecord
  belongs_to :curriculum
  belongs_to :user

  def curriculum_title
    curriculum.title
  end

  def user_username
    user.username
  end
end
