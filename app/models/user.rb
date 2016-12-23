
class User < ApplicationRecord

  # Include default devise modules. Others available are:
  #, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable# TODO: reinstate, :confirmable

  has_many  :submitted_resources,
            foreign_key: :submitter_id,
            class_name: "Resource",
            dependent: :nullify

  has_many  :curriculums,
            foreign_key: :creator_id,
            dependent: :nullify

  has_many  :curriculums_users,
            dependent: :destroy

  has_many  :copied_curriculums, through: :curriculums_users, source: :curriculum,
                                 class_name: 'Curriculum'


  has_many :feedbacks, dependent: :nullify

  has_many :comments, dependent: :nullify


  def created?(curriculum)
    id == curriculum.creator_id
  end

  def confrimation_required?
    false
  end

  def all_curriculums_paginated( page )
    created_curriculum_ids = self.curriculums.pluck(:id)
    copied_curriculum_ids = self.copied_curriculums.pluck(:id)

    Curriculum.where(id: (created_curriculum_ids + copied_curriculum_ids))
              .paginate(page: page, per_page: 4)
  end

  def completed_resources
    Resource.completed_by( self.id )
  end

  def completed?( resource )
    completed_resources.include? resource
  end
end
