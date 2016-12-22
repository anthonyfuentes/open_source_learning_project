class FeedbacksController < ApplicationController
  before_action :set_resource, only: [:new, :create]

  def new
    @feedback = @resource.feedbacks.build
  end

  def create
    @feedback = @resource.feedbacks.build( resource_params )
    @feedback.user_id = current_user.id
    @feedback.save ? successful_create : failed_create
  end

  def edit
  end

  def update
  end

  private

    def successful_create
      flash[:success] = "Thanks for sharing! <3"
      redirect_to resources_path
      # TODO: redirect to user profile showing resources they've submitted
    end

    def failed_create
      flash[:danger] = @feedback.errors.full_messages
      render :new
    end

    def set_resource
      @resource = Resource.find_by_id( params[:resource_id] )
    end

    def resource_params
      params.require(:feedback).permit(:difficulty,
                                       :completion_minutes,
                                       :rating)
    end
end