class ResourcesController < ApplicationController

  def new
    @resource = Resource.new
    @resource.links.build
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.save ? successful_create : failed_create
  end

  def show
  end

  private

    def successful_create
      flash[:success] = "#{@resource.name} shared."
      redirect_to request.referer
      # redirect_to new_feedback_path TODO: actually do this
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

end
