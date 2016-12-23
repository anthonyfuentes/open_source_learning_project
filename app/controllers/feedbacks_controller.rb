
class FeedbacksController < ApplicationController
  before_action :set_resource, only: [:new, :create]

  def new
    # TODO: make abstract to apply to curriculumns as well
    @feedback = @resource.feedbacks.build
    session[:referrer] = request.referrer
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

      redirect_after_create
    end

    def redirect_after_create
      if session[:referrer].include?('curriculums')
        redirect_to session[:referrer]
        session[:referrer] = nil
      else
        redirect_to user_shared_path(current_user)
      end
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
