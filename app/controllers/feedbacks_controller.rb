
class FeedbacksController < ApplicationController
  before_action :set_resource, only: [:new, :create]

  def new
    @feedback = @resource.feedbacks.build
    cookies.signed[:referrer] = request.referrer
  end

  def create
    raise
    @feedback = @resource.feedbacks.build(resource_params)
    @feedback.user_id = current_user.id
    @feedback.save ? successful_create : failed_create
  end

  def destroy
    @feedback = current_user.feedbacks
      .find_by(feedbackable_id: params[:feedbackable_id],
              feedbackable_type: params[:feedbackable_type],
              user_id: current_user.id)
    @feedback.destroy ? successful_destroy : failed_destroy
  end

  private

    def successful_create
      flash[:success] = "Thanks for your input"
      redirect_after_create
    end

    def redirect_after_create
      if cookies.signed[:referrer].include?('curriculums')
        redirect_to cookies.signed[:referrer]
        cookies.signed[:referrer] = nil
      else
        redirect_to user_shared_path(current_user)
      end
    end

    def failed_create
      flash.now[:danger] = failed_create_flash_messages
      render :new
    end

    def failed_create_flash_messages
      error_messages = @feedback.errors.full_messages
      unwanted_message = "User has already been taken"
      if error_messages.include?(unwanted_message)
        error_messages.delete(unwanted_message)
        error_messages << "You should only review a resource once"
      end
    end

    def successful_destroy
      redirect_to request.referrer
    end

    def failed_destroy
      flash[:danger] = "Something went wrong, and we're on it"
      redirect_to request.referrer
    end

    def set_resource
      @resource = Resource.find_by_id(params[:resource_id])
    end

    def resource_params
      params.require(:feedback).permit(:difficulty,
                                       :completion_minutes,
                                       :rating)
    end
end
