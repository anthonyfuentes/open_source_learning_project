
class SharedResourcesController < ApplicationController

  def index
    @user = User.find_by_id(params[:user_id])
    @shared_resources = Resource.where(submitter_id: @user.id)
      .paginate(page: params[:page], per_page: 5)
  end

end
