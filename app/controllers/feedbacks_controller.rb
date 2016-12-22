
class FeedbacksController < ApplicationController
  before_action :set_resource, only: [:new, :create]

  def new
    @feedback = @resource.feedbacks.build
    # TODO: make abstract to apply to curriculumns as well
  end

  def create
    #TODO: Check for duplicates from same user
    @feedback = @resource.feedbacks.build( resource_params )
    @feedback.user_id = current_user.id
    @feedback.save ? successful_create : failed_create
  end

  private

    def successful_create
      flash[:success] = "Thanks for sharing! <3"
      redirect_to user_shared_path(current_user)
    end

    def failed_create
      flash.now[:danger] = @feedback.errors.full_messages
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
