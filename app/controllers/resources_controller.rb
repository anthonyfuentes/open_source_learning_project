class ResourcesController < ApplicationController

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
      @resources = Resource.preload(:links, :submitter)
      binding.pry
      @resources = @resources.index_search(params)
      @resources = @resources.results
    end 
  end

  private

    def successful_create
      redirect_to new_resource_feedback_path @resource
    end

    def failed_create
      flash[:danger] = @resource.errors.full_messages
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
        link_attributes: [:url]
      )
    end

    def query_params
      params.permit(:q)
    end

end
