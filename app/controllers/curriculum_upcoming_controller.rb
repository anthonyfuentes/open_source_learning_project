
class CurriculumUpcomingController < ApplicationController

  def index
    @curriculum = Curriculum.find(params[:curriculum_id])

    completed = Resource.left_outer_joins(:feedbacks)
      .where(feedbacks: { user_id: current_user.id })

    @resources = @curriculum.resources - completed
  end

end
