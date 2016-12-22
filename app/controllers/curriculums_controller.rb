
class CurriculumsController < ApplicationController

  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = current_user.curriculums.build(curriculum_params)
    @curriculum.save ? successful_create : failed_create
  end

  private

  def successful_create
    cookies[:curriculum_id] = @curriculum.id
    redirect_to resources_path
  end

  def failed_create
  end

    def curriculum_params
      params.require(:curriculum).permit(:title, :subtitle,
                                         :description)
    end
end
