class FeedbacksController < ApplicationController
  before_action :set_resource, only: [:new, :create]

  def new
    @feedback = @resource.feedbacks.build
  end

  def create
    @feedback = @resource.feedbacks.build( resource_params )

    #anthony's ternary
  end

  def edit
  end

  def update
  end

  private

    def set_resource
      @resource = Resource.find_by_id( params[:resource_id] )
    end

    def resource_params
      params.require(:resource).permit(:difficulty,
                                       :completion_minutes,
                                       :rating)
    end
end
