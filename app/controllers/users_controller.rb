
class UsersController < ApplicationController

  def show
    redirect_to user_shared_path(user_id: params[:id])
  end

end
