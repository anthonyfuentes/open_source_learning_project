
class SharedResourcesController < ApplicationController

  def index
    @user = User.find_by_id(params[:user_id])
    @shared_resources = Resource.where(submitter_id: @user.id)
  end

end
