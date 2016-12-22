
class CurriculumsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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

  def index
    if params[:q].nil?
      @curriculums = Curriculum.paginate(page: params[:page], per_page: 10).all
    else
      @curriculums = Curriculum.search params[:q]
      binding.pry
      @curriculums = @curriculums.records
      @curriculums = filter_results(@curriculums)
      @curriculums = @curriculums.paginate(page: params[:page], per_page: 10)
      if @curriculums.empty?
        flash.now[:danger] = "no results"
        @curriculums = filter_results(Curriculum)
        @curriculums = @curriculums.paginate(page: params[:page], per_page: 10)
      end
    end
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

    def filter_results(result)
    result = result.where(category_id: params[:category_id].to_i) unless params[:category_id] == ""
    result = result.joins("FULL JOIN resources_tag ON resources_tag.resource_id = resource.id").where(tag_id: params[:tag_id]) if params[:tag_id] & !params[:tag_id] == ""
    result = result.all unless !params[:category_id] == ""
  end
end
