
class CurriculumProgressController < ApplicationController

  def index
    @curriculum = Curriculum.find(params[:curriculum_id])
    @resources = @curriculum.resources.completed_by( current_user.id )
  end

end

