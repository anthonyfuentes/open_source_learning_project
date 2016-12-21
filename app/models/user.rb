class User < ApplicationRecord
  has_many :submitted_resources, 
            foreign_key: :submitter_id, 
            class_name: "Resource", 
            dependent: :nullify

  has_many :curriculums, 
           foreign_key: :creator_id,
           dependent: :nullify 

  has_many :feedbacks, dependent: :nullify



end
