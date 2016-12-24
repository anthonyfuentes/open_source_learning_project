
module CurriculumsResourcesHelper

  def curriculum_resource_toggle_link(curriculum_id, resource_id)
    if curriculum_resource = CurriculumsResource.find_by(curriculum_id: curriculum_id,
                                                          resource_id: resource_id)
      remove_link( curriculum_resource )
    else
      add_link( curriculum_id, resource_id )
    end
  end

  def display_time(feedbackable)
    completion_time = feedbackable.attribute_average(:completion_minutes)
    if feedbackable.no_feedback?
      "No Time Data \nYet"
    elsif completion_time < 60
      "~#{completion_time.round(1)} mins\non Average"
    else
      completion_time /= 60
      "~#{completion_time.round(1)} hrs\non Average"
    end
  end

  private

    def add_link(curriculum_id, resource_id)
      link_to("Add",
              curriculums_resources_path( curriculum_id: curriculum_id,
              resource_id: resource_id ),
              class: 'btn btn-success',
              method: :post )
    end

    def remove_link(curriculum_resource)
      link_to("Remove",
              curriculums_resource_path(curriculum_resource),
              class: 'btn btn-danger',
              method: :delete)
    end

end
