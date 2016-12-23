
class CurriculumsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_by_id, only: [:show, :destroy]

  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = current_user.curriculums.build(curriculum_params)
    @curriculum.save ? successful_create : failed_create
  end

  def show
    @resources = @curriculum.resources.sort_by do |resource|
      resource.curriculums_resources
        .where(curriculum_id: @curriculum.id)
        .first
        .order
    end
    @tags = aggregate_tags(@resources)
  end

  def index
    if params[:q].nil?
      @curriculums = Curriculum.paginate(page: params[:page],
                                         per_page: 10).all
    else
      @curriculums = Curriculum.search params[:q]
      @curriculums = @curriculums.records
      @curriculums = @curriculums.paginate(page: params[:page],
                                           per_page: 10)
      if @curriculums.empty?
        @curriculums = @curriculums.paginate(page: params[:page],
                                             per_page: 10)
      end
    end
  end

  def edit
    session[:curriculum_id] = nil
    @curriculum = Curriculum.find_by(id: params[:id],
                                    creator_id: current_user.id)
    @resources = @curriculum.resources.paginate(page: params[:page], per_page: 5)
  end

  def update
    @curriculum = Curriculum.find_by(id: params[:id],
                                     creator_id: current_user.id)
    if @curriculum.update(curriculum_params)
      successful_update
    else
      failed_update
    end
  end

  def destroy
    @curriculum.destroy ? successful_destroy : failed_destroy
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

  def successful_update
    redirect_to request.referrer
  end

  def failed_update
    flash.now[:danger] = @curriculum.errors.full_messages
    render :edit
  end

  def successful_destroy
    flash[:success] = "#{@curriculum.title} destroyed"
    redirect_to user_curriculums_path(current_user.id)
  end

  def failed_destroy
    flash[:danger] = "Something went wrong. We'll get right on it!"
    render :edit
  end

  def find_by_id
    @curriculum = Curriculum.find_by(id: params[:id])
  end

  def curriculum_params
    params.require(:curriculum).permit(:title,
                                       :subtitle,
                                       :description,
                                        curriculums_resources_attributes:
                                        [:id, :order])
  end

  def filter_results(result)
    result = result.where(category_id: params[:category_id].to_i) unless params[:category_id] == ""
    result = result.joins("FULL JOIN resources_tag ON resources_tag.resource_id = resource.id").where(tag_id: params[:tag_id]) if params[:tag_id] & !params[:tag_id] == ""
    result = result.all unless !params[:category_id] == ""
  end

  def aggregate_tags(resources)
    tags = []
    resources.each do |resource|
      resource.tags.each do |tag|
        tags << tag
      end
    end
    tags
  end

end
