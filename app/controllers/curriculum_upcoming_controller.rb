class CurriculumUpcomingController < ApplicationController

  def index
    @curriculum = Curriculum.find(params[:curriculum_id])
    @resources = 
  end
end
