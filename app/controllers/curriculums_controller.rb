
class CurriculumsController < ApplicationController

  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = current_user.curriculums.build(curriculum_params)
    @curriculum.save ? successful_create : failed_create
  end

  def show
    session[:curriculum_id] = nil
    @curriculum = Curriculum.find_by(id: params[:id])
  end

  private

    def successful_create
      session[:curriculum_id] = @curriculum.id
      redirect_to resources_path
    end

    def failed_create
      flash.now[:danger] = @curriculum.errors.full_messages
      render :new
    end

    def curriculum_params
      params.require(:curriculum).permit(:title, :subtitle,
                                         :description)
    end
end
