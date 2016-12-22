
class User < ApplicationRecord
  # Include default devise modules. Others available are:
   #, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :submitted_resources,
            foreign_key: :submitter_id,
            class_name: "Resource",
            dependent: :nullify

  has_many :curriculums,
           foreign_key: :creator_id,
           dependent: :nullify

  has_many :feedbacks, dependent: :nullify


  def confrimation_required?
    false
  end

end
