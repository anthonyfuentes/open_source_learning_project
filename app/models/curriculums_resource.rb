
class CurriculumsResource < ApplicationRecord
  belongs_to :curriculum
  belongs_to :resource

  def curriculum_title
    curriculum.title
  end
end
