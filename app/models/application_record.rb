class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def attribute_average(feedbackable, attribute)
    id = feedbackable.id
    type = feedbackable.class.name
    if feedbackable.has_attribute?(attribute)
      Feedback.where("feedbackable_id = #{id} and feedbackable_type = #{type}")
              .average(attribute).to_f
    end
  end

end
