class CurriculumsController < ApplicationController

  def new
    @curriculum = Curriculum.new
  end

  def create
  end

  private

    def curriculum_params
      params.require(:curriculum).permit(:title, :subtitle,
                                         :description)
    end
end
