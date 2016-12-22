
module CurriculumsResourcesHelper

  def curriculum_resource_toggle_link( curriculum_id, resource_id)
    if curriculum_resource = CurriculumsResource.find_by( curriculum_id: curriculum_id,
                                                          resource_id: resource_id )
      remove_link( curriculum_resource )
    else
      add_link( curriculum_id, resource_id )
    end
  end

  private

    def add_link( curriculum_id, resource_id )
      link_to("Add to #{Curriculum.find_by(id: curriculum_id).title}",
              curriculums_resources_path( curriculum_id: curriculum_id,
              resource_id: resource_id ),
              class: 'btn btn-success btn-sm',
              method: :post )
    end

    def remove_link( curriculum_resource )
      link_to("Remove from #{curriculum_resource.curriculum_title}",
              curriculums_resource_path( curriculum_resource ),
              class: 'btn btn-danger btn-sm',
              method: :delete )
    end

end
