
class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def new
    @resource = Resource.new
    @resource.links.build
    @resource.feedbacks.build
  end

  def create
    @resource = current_user.submitted_resources.build(resource_params)
    @resource.feedbacks.first.user = current_user
    @resource.save ? successful_create : failed_create
  end

  def show
    @resource = Resource.find(params[:id])
    @tags = @resource.tags.limit(3)
  end

  def index
    # TODO convert to method
    unless cookies.signed[:curriculum_id]
      cookies.signed[:curriculum_id] = params[:curriculum_id]
    end

    if params[:q].nil?
      @resources = Resource.paginate(page: params[:page], per_page: 10).includes(:links, :submitter).all
    else
      @resources = Resource.search params[:q]
      @resources = @resources.records
      @resources = filter_results(@resources)
      @resources = @resources.paginate(page: params[:page], per_page: 10)
      if @resources.empty?
        @resources = filter_results(Resource)
        @resources = @resources.paginate(page: params[:page], per_page: 10)
      end
    end
  end

  private

    def successful_create
      redirect_to resources_path
    end

    def failed_create
      render :new
    end

    def resource_params
      params.require(:resource).permit(
        :title,
        :subtitle,
        :description,
        :media_type,
        :credits,
        :category_id,
        links_attributes: [:url],
        feedbacks_attributes: [:completion_minutes,
                               :rating, :difficulty])
    end

    def query_params
      params.permit(:q)
    end

  def filter_results(result)
    result = result.where(category_id: params[:category_id].to_i) unless params[:category_id] == ""
    result = result.joins("FULL JOIN resources_tag ON resources_tag.resource_id = resource.id").where(tag_id: params[:tag_id]) if params[:tag_id] && !params[:tag_id] == ""
    result = result.all unless !params[:category_id] == ""
  end

end
