module CurriculumsUsersHelper

  def copy_curriculum_link(curriculum_id)
    if current_user
      if curriculum_user = CurriculumsUser.find_by( curriculum_id: curriculum_id,
                                                    user_id: current_user.id )
        remove_curriculum_link( curriculum_user )
      elsif !in_users_created_curriculums?(curriculum_id)
        add_curriculum_link( curriculum_id )
      end
    end
  end

  private

    def in_users_copied_curriculums?( curriculum_id )
      current_user.copied_curriculums.pluck(:id).include?(curriculum_id)
    end

    def in_users_created_curriculums?( curriculum_id )
      current_user.curriculums.pluck(:id).include?(curriculum_id)
    end

    def add_curriculum_link( curriculum_id )
      link_to("Study Curriculum",
              curriculums_users_path( curriculum_id: curriculum_id,
              user_id: current_user.id ),
              class: 'btn btn-success pull-right',
              method: :post )
    end

    def remove_curriculum_link( curriculum_user )
      link_to("Remove",
              curriculums_user_path( curriculum_user ),
              class: 'btn btn-default pull-right',
              method: :delete )
    end
end
