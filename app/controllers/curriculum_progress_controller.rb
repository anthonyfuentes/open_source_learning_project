class CurriculumProgressController < ApplicationController

  def index
    @curriculum = Curriculum.find(params[:curriculum_id])
    @resources = Resource.completed_by( current_user.id )
  end

end
