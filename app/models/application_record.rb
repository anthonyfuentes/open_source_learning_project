class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def attribute_average(attribute)
    return nil unless Feedback.has_attribute?(attribute)

    Feedback.where("feedbackable_id = #{self.id} and
                    feedbackable_type = '#{self.class.name}'")
                   .average(attribute).to_f
  end

end
