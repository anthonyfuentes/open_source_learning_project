
module CurriculumsHelper

  def add_resources_link(curriculum)
    if current_user && current_user.created?(curriculum)
      link_to "Add Resources",
        resources_path(curriculum_id: curriculum.id),
        class: "btn btn-primary"
    end
  end

  def edit_curriculum_link(curriculum)
    if current_user && current_user.created?(curriculum)
      link_to "Edit",
        edit_user_curriculum_path(current_user.id, curriculum.id),
        class: "btn btn-primary pull-right"
    end
  end

  def delete_curriculum_link(curriculum)
    link_to "Delete",
      user_curriculum_path(current_user.id, @curriculum.id),
      class: "btn btn-danger pull-right",
      method: :delete
  end

  def copy_curriculum_link(curriculum_id)
    # TODO actually implement
    if true
      link_to "Study Curriculum", '#',
        class: 'btn btn-success'
    else
    end
  end

end
