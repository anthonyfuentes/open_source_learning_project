class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def attribute_average(attribute)
    return nil unless Feedback.has_attribute?(attribute)

    Feedback.where("feedbackable_id = #{self.id} and
                    feedbackable_type = '#{self.class.name}'")
                   .average(attribute).to_f.round(1)
  end

  def category_name
    class_name = self.class.name
    return nil unless class_name.constantize.reflect_on_association(:category)

    if self.category.nil?
      "None"
    else
      self.category.name
    end
  end

end
