
module CurriculumsHelper

  def copy_curriculum_link(curriculum_id)
    # TODO actually implement
    if true
      link_to("Study #{Curriculum.find_by(id: curriculum_id).title}",
              '#',
              class: 'btn btn-success')
    else
    end
  end

end
