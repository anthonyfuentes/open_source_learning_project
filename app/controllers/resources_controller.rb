
class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @resource = Resource.new
    @resource.links.build
  end

  def create
    @resource = current_user.submitted_resources.build(resource_params)
    @resource.save ? successful_create : failed_create
  end

  def show
  end

  def index
    if params[:q].nil?
      @resources = Resource.includes(:links, :submitter).all
    else
      @resources = Resource.search params[:q]
      @resources = @resources.records
      @resources = filter_results(@resources)
      if @resources.empty? 
        flash.now[:danger] = "no results"
        @resources = filter_results(Resource)
      end
    end 
  end

  private

    def successful_create
      redirect_to new_resource_feedback_path @resource
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
        links_attributes: [:url])
    end

    def query_params
      params.permit(:q)
    end

  def filter_results(result)
    result = result.where(category_id: params[:category_id].to_i) unless params[:category_id] == ""
    result = result.joins("OUTER JOIN resources_tag ON resources_tag.resource_id = resource.id").where(tag_id: params[:tag_id]) if params[:tag_id] & !params[:tag_id] == ""
    result = result.all unless !params[:category_id] == "" 
  end

end
