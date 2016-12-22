
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
    @resource = Resource.find(params[:id])
  end

  def index
    @resources = Resource.paginate(page: params[:page], per_page: 10)
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

end
