class CurriculumProgressController < ApplicationController

  def index
    @curriculum = Curriculum.find(params[:curriculum_id])
    @resources = Resource.left_outer_joins(:feedbacks)
      .where(feedbacks: { user_id: current_user.id })
  end

end
